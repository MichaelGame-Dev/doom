;;; gamedev-capture.el --- Game development capture templates -*- lexical-binding: t; -*-

(require 'org)
(require 'org-capture)

(defgroup gamedev-capture nil
  "Customization options for gamedev-capture."
  :group 'org
  :prefix "gamedev-capture-")

(defcustom gamedev-capture-file (expand-file-name "~/org/gamedev.org")
  "File for storing game development resources."
  :type 'string
  :group 'gamedev-capture)

(defcustom gamedev-capture-frame-parameters
  '((name . "Org Capture - GameDev")
    (width . 80)
    (height . 20)
    (toolbar-lines . 0)
    (menu-bar-lines . 0)
    (internal-border-width . 10)
    (left . 0.5)
    (top . 0.3))
  "Frame parameters for the gamedev capture frame."
  :type 'alist
  :group 'gamedev-capture)

(defun gamedev-capture-ensure-file ()
  "Make sure the gamedev capture file exists."
  (unless (file-exists-p gamedev-capture-file)
    (with-temp-file gamedev-capture-file
      (insert "#+TITLE: Game Development Resources\n\n"
              "* Resources\n\n"
              "* Art Resources\n\n"
              "* Code Resources\n\n"))))

;;;###autoload
(defun gamedev-capture-in-frame ()
  "Create a new frame for game dev resource capture."
  (interactive)
  (select-frame (make-frame gamedev-capture-frame-parameters))
  (org-capture nil "g"))

(defun gamedev-capture-finalize-frame ()
  "Close frame after capture is finalized."
  (when (equal (frame-parameter nil 'name) "Org Capture - GameDev")
    (delete-frame)))

;;;###autoload
(defun gamedev-capture-setup ()
  "Set up game development capture templates and hooks."
  (gamedev-capture-ensure-file)

  ;; Define templates with explicit target specifications
  (add-to-list 'org-capture-templates
               `("g" "Game Dev Resource" entry
                 (file+headline ,gamedev-capture-file "Resources")
                 "* %^{Resource Title}\n:PROPERTIES:\n:URL: %^{URL}\n:ADDED: %U\n:END:\n\n%^{Description}\n\n%?"
                 :empty-lines 1))

  (add-hook 'org-capture-after-finalize-hook #'gamedev-capture-finalize-frame))

(provide 'gamedev-capture)
;;; gamedev-capture.el ends here
