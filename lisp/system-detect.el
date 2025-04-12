;;; lisp/system-detect.el -*- lexical-binding: t; -*-

;;; Commentary:
;; System detection for conditional configuration loading

;;; Code:

(defvar my/machine-type
  (cond
   ;; First check for marker files
   ((file-exists-p "~/.is-work-machine") 'work)
   ((file-exists-p "~/.is-personal-machine") 'personal)

   ;; Then fall back to hostname checks
   ((member (system-name) '("work-laptop" "work-desktop")) 'work)
   ((member (system-name) '("home-desktop" "personal-laptop")) 'personal)

   ;; Default fallback
   (t 'unknown))
  "Symbol indicating the type of machine Emacs is running on.")

(defun my/is-work-machine-p ()
  "Return t if this is a work machine."
  (eq my/machine-type 'work))

(defun my/is-personal-machine-p ()
  "Return t if this is a personal machine."
  (eq my/machine-type 'personal))

(provide 'system-detect)
;;; system-detect.el ends here
