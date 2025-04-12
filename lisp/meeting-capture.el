;;; lisp/meeting-capture.el -*- lexical-binding: t; -*-

;;; lisp/meeting-capture.el -*- lexical-binding: t; -*-

;;; Commentary:
;; Advanced meeting capture system for Org mode
;; This file provides a structured way to capture meeting notes with
;; automatic selection of meeting types, people, and attendees.

;;; Code:

(require 'system-detect nil t)  ;; Optional dependency for machine-specific config

;;;; Variables

(defvar my/meeting-categories
  '(("1:1" . ("Manager" "Direct Report A" "Direct Report B"))
    ("Client" . ("Client X" "Client Y" "Client Z")))
  "Categories and people for meetings.")

(defvar my/attendee-lists
  '(("Manager" . ("VP Product" "CTO" "HR Director"))
    ("Direct Report A" . ("Team Member 1" "Team Member 2"))
    ("Direct Report B" . ("Team Member 3" "Team Member 4"))
    ("Client X" . ("John Smith" "Jane Doe" "Bob Johnson"))
    ("Client Y" . ("Alice Brown" "David Wilson" "Emma Davis"))
    ("Client Z" . ("Michael Lee" "Sarah Miller" "Robert Taylor")))
  "Lists of common attendees for each person/client.")

;;;; Helper Functions

(defun my/select-attendees (person)
  "Select attendees from a predefined list for PERSON with completion."
  (let* ((attendee-list (cdr (assoc person my/attendee-lists)))
         (selected-attendees '())
         (prompt (format "Select attendees for %s meeting: " person))
         attendee)
    (if (not attendee-list)
        (read-string "Attendees (comma-separated): ")
      (while (setq attendee
                   (completing-read
                    prompt
                    (cl-set-difference attendee-list selected-attendees :test #'string=)
                    nil nil nil nil nil))
        (unless (string-empty-p attendee)
          (push attendee selected-attendees)
          (setq prompt (format "Select additional attendees (%s selected): "
                               (mapconcat #'identity selected-attendees ", ")))))
      (if selected-attendees
          (mapconcat (lambda (name) (format "- %s" name))
                     (nreverse selected-attendees) "\n")
        "None"))))

;;;; Main Capture Function

(defun my/capture-meeting-with-attendees ()
  "Advanced meeting capture with person/client and attendee selection."
  (interactive)
  (let* ((category (completing-read "Meeting type: " (mapcar #'car my/meeting-categories)))
         (person (completing-read (format "Select %s: " category)
                                  (cdr (assoc category my/meeting-categories))))
         (file-path (expand-file-name
                     (format "meetings/%s-%s.org"
                             (downcase (replace-regexp-in-string ":" "on" category))
                             (downcase (replace-regexp-in-string " " "-" person)))
                     org-directory))
         (is-new-file (not (file-exists-p file-path)))
         (attendees (if (string= category "1:1")
                        (read-string "Extra attendees (if any): ")
                      (my/select-attendees person))))

    ;; Create file with top-level heading if it doesn't exist
    (when is-new-file
      (make-directory (file-name-directory file-path) t)  ;; Create directory if needed
      (with-temp-file file-path
        (insert (format "#+TITLE: Meetings with %s\n#+AUTHOR: Your Name\n#+STARTUP: overview\n\n* %s\n"
                        person person))))

    ;; Set the capture template with the exact format requested
    (setq org-capture-templates
          `(("m" "Meeting" entry
             (file+headline ,file-path ,(format "%s" person))
             ,(if (string= category "1:1")
                  (format "* <%<%Y-%m-%d %a %H:%M>> Meeting\n\n** Extra Attendees\n%s\n\n** Notes\n\n** My Action Items\n*** TODO \n\n** Others' Action Items\n*** TODO \n"
                          (if (string= attendees "") "None" attendees))
                (format "* <%<%Y-%m-%d %a %H:%M>> Meeting\n\n** Attendees\n%s\n\n** Notes\n\n** My Action Items\n*** TODO \n\n** Others' Action Items\n*** TODO \n"
                        attendees))
             :prepend t)))

    (org-capture nil "m")
    file-path))

;;;; Machine-specific configurations

;; Optional: Configure different meeting partners based on machine type
(when (and (featurep 'system-detect) (boundp 'my/machine-type))
  (cond
   ((eq my/machine-type 'work)
    ;; Work-specific meeting partners
    (setq my/meeting-categories
          '(("1:1" . ("Work Manager" "Work Direct Report A"))
            ("Client" . ("Work Client X" "Work Client Y"))))

    (setq my/attendee-lists
          '(("Work Manager" . ("VP Product" "CTO"))
            ("Work Direct Report A" . ("Team Member 1" "Team Member 2"))
            ("Work Client X" . ("John Smith" "Jane Doe"))
            ("Work Client Y" . ("Alice Brown" "David Wilson")))))

   ((eq my/machine-type 'personal)
    ;; Personal projects meeting partners
    (setq my/meeting-categories
          '(("1:1" . ("Project Collaborator" "Mentor"))
            ("Client" . ("Personal Client A" "Personal Client B"))))

    (setq my/attendee-lists
          '(("Project Collaborator" . ("Collaborator 1" "Collaborator 2"))
            ("Mentor" . ("Industry Contact" "Academic Advisor"))
            ("Personal Client A" . ("Client Contact 1" "Client Contact 2"))
            ("Personal Client B" . ("Client Contact 3" "Client Contact 4")))))))

(provide 'meeting-capture)
;;; meeting-capture.el ends here
