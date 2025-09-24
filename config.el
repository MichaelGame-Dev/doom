;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setopt custom-file (locate-user-emacs-file "custom-gui.el"))
(load custom-file :no-error-if-file-is-missing)
(add-to-list 'load-path (expand-file-name "lisp" doom-private-dir))
(setopt highlight-indent-guides-method  'column)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-ig-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;; Code:
(setopt doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 13.0 :weight 'Regular)
        doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13.0 :weight 'Regular)
        doom-symbol-font (font-spec :famil "FiraCode Nerd Font" :size 13.0))

(setopt nerd-icons-font-family "Fira Code")
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-onei)
;;
(require 'modus-themes)
(setopt modus-themes-italic-constructs t
        modus-themes-bold-constructs nil)
modus-themes-completions
'((matches . (extrabold))
  (selection . (semibold italic text-also)))
(setopt modus-themes-disable-other-themes t)

(setopt doom-theme 'modus-vivendi)
;;(load-theme 'modus-vivendi :no-confirm)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setopt display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setopt org-directory "~/org/")

;; (use-package nov-xwidget
;;   :demand t
;;   :after nov
;;   :config
;;   (define-key nov-mode-map (kbd "o") 'nov-xwidget-view)
;;   (add-hook 'nov-mode-hook 'nov-xwidget-inject-all-files))
;; ;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
(setopt nov-unzip-program (executable-find "bsdtar")
        nov-unzip-args '("-xC" directory "-f" filename))
(setopt flycheck-checker-error-threshold 2000)
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Ruby LSP
;; Enable odin-mode and configure OLS as the language server
;; (use-package! odin-mode
;; :mode ("\\.odin\\'" . odin-mode)
;; :hook (odin-mode . lsp))

;; Add OLS to the list of available programs
;; NOTE: As of Emacs 30, this is not needed.
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs '((odin-ts-mode) . ("ols"))))

;; Add a hook to autostart OLS
;; (add-hook 'odin-mode-hook #'lsp)
;; (add-hook 'odin-ts-mode-hook #'eglot-ensure) ;; If you're using the TS mode


;; Set up OLS as the language server for Odin, ensuring lsp-mode is loaded first
;; Pull the lsp-mode package
;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred))

;; ;; Set up OLS as the language server for Odin, ensuring lsp-mode is loaded first
;; (with-eval-after-load 'lsp-mode
;;   (setq-default lsp-auto-guess-root t) ;; Helps find the ols.json file with Projectile or project.el
;;   ;; (add-to-list 'lsp-language-id-configuration '(odin-mode . "odin"))
;;   (add-to-list 'lsp-language-id-configuration '(odin-ts-mode . "odin"))

;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-stdio-connection "/home/michael/code/odin/ols/ols") ;; Adjust the path here
;;                     :major-modes '(odin-ts-mode)
;;                     :server-id 'ols
;;                     :multi-root t))) ;; Ensures lsp-mode sends "workspaceFolders" to the server

;; ;; Add a hook to autostart OLS
;; ;; (add-hook 'odin-mode-hook #'lsp-deferred)
;; (add-hook 'odin-ts-mode-hook #'lsp-deferred) ;; If you're using the TS mode





;; (with-eval-after-load 'lsp-mode
;;   (setq-default lsp-auto-guess-root t) ;; Helps find the ols.json file with Projectile or project.el
;;   (setq lsp-language-id-configuration (cons '(odin-mode . "odin") lsp-language-id-configuration))

;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-stdio-connection "ols OR path_to_ols_binary")
;;                     :major-modes '(odin-mode)
;;                     :server-id 'ols
;;                     :multi-root t))) ;; Ensures lsp-mode sends "workspaceFolders" to the server
;; Load gamedev-capture module
(use-package! gamedev-capture
  :load-path "~/.config/doom/modules/custom"
  :config
  (gamedev-capture-setup)
  :bind
  (("C-c g" . gamedev-capture-in-frame)))

;; If you want to use Doom's keybinding system instead:
(map! :leader
      (:prefix ("c" . "capture")
       :desc "GameDev in new frame" "g" #'gamedev-capture-in-frame))


;; Denote
(use-package denote
  :ensure t
  :hook (dired-mode . denote-dired-mode)
  :bind
  (("C-c n n" . denote)
   ("C-c n r" . denote-rename-file)
   ("C-c n l" . denote-link)
   ("C-c n b" . denote-backlinks)
   ("C-c n d" . denote-sort-dired))
  :config
  (setq denote-directory (expand-file-name "~/org/notes/"))

  ;; Automatically rename Denote buffers when opening them so that
  ;; instead of their long file name they have, for example, a literal
  ;; "[D]" followed by the file's title.  Read the doc string of
  ;; `denote-rename-buffer-format' for how to modify this.
  (denote-rename-buffer-mode 1))


;; org remark
(use-package org-remark-global-tracking
  ;; It is recommended that `org-remark-global-tracking-mode' be
  ;; enabled when Emacs initializes. You can set it in
  ;; `after-init-hook'.
  :hook after-init
  :config
  ;; Selectively keep or comment out the following if you want to use
  ;; extensions for Info-mode, EWW, and NOV.el (EPUB) respectively.
  (use-package org-remark-info :after info :config (org-remark-info-mode +1))
  (use-package org-remark-eww  :after eww  :config (org-remark-eww-mode +1))
  (use-package org-remark-nov  :after nov  :config (org-remark-nov-mode +1)))

(use-package! org-remark
  :bind (;; :bind keyword also implicitly defers org-remark itself.
         ;; Keybindings before :map is set for global-map. Adjust the keybinds
         ;; as you see fit.
         ("C-c n m" . org-remark-mark)
         ("C-c n l" . org-remark-mark-line)
         :map org-remark-mode-map
         ("C-c n o" . org-remark-open)
         ("C-c n ]" . org-remark-view-next)
         ("C-c n [" . org-remark-view-prev)
         ;; ("C-c n r" . org-remark-remove)
         ("C-c n -" . org-remark-delete)))

(keycast-header-line-mode t)


;; Text Scaling
;; TODO: Load the mode here
(after! persist-text-scale
  (setopt persist-text-scale-autosave-interval (* 7 60))
  (persist-text-scale-mode))

;; (add-to-list 'load-path "~/.config/doom/lisp/obs-websocket")
;; Obs web sockets
;; (use-package websocket)
;; (defun my/twitch-message (text)
;;   (interactive "MText: ")
;;   (with-current-buffer
;;       (get-buffer-create "Twitch message")
;;     (erase-buffer)
;;     (insert text)
;;     (goto-char (point-min))))
;; (use-package! obs-websocket
;;   :config
;;   (defhydra my/obs-websocket (:exit t)
;;             "Control Open Broadcast Studio"
;;             ("c" (obs-websocket-connect) "Connect")
;;             ("d" (obs-websocket-send "SetCurrentScene" :scene-name "Desktop") "Desktop")
;;             ("e" (obs-websocket-send "SetCurrentScene" :scene-name "Emacs") "Emacs")
;;             ("i" (obs-websocket-send "SetCurrentScene" :scene-name "Intermission") "Intermission")
;;             ("v" (browse-url "https://twitch.tv/sachachua"))
;;             ("m" my/twitch-message "Message")
;;           ("t" my/twitch-message "Message")
;;           ("<f8>" my/twitch-message "Message") ;; Then I can just f8 f8
;;           ("sb" (obs-websocket-send "StartStreaming") "Stream - begin")
;;           ("se" (obs-websocket-send "StopStreaming") "Stream - end"))
;; (global-set-key (kbd "<f8>") #'my/obs-websocket/body))
;;  :load-path "~/.config/doom/lisp/obs-websocket.el" :ensure nil);
(use-package! websocket)
(use-package! obs-websocket
  :after websocket
  :config
  (setopt obs-websocket-url "ws://localhost:4455")
  (setopt obs-websocket-password "your-password-here")

  ;; Define some useful functions
  (defun my/obs-toggle-recording ()
    (interactive)
    (obs-websocket-send "StartStopRecording"))

  (defun my/obs-switch-scene (scene-name)
    (interactive "Scene name: ")
    (obs-websocket-send "SetCurrentScene" `(("scene-name" . ,scene-name)))))

;; Set up key bindings
;; (map! :leader
;;       (:prefix ("o" . "open")
;;                (:prefix ("b" . "obs")
;;                 :desc "Connect to OBS" "c" #'obs-websocket-connect
;;                 :desc "Toggle recording" "r" #'my/obs-toggle-recording
;;                 :desc "Switch scene" "s" #'my/obs-switch-scene))))
(require 'auth-source)
;; (let ((client-id (auth-source-pick-first-password :host "spotify.com" :user "client-id"))
;;       (client-secret (auth-source-pick-first-password :host "spotify.com" :user "client-secret")))
;;   (if (and client-id client-secret)
;;       (setq smudge-oauth2-callback-port "9999")

(when (string= (system-name) "gamedev")
  (setopt smudge-oauth2-callback-port "9999")
  (use-package! smudge
    :bind-keymap ("C-c ." . smudge-command-map)
    :custom
    (smudge-oauth2-client-secret (auth-source-pick-first-password :host "spotify.com" :user "client-secret"))
    (smudge-oauth2-client-id (auth-source-pick-first-password :host "spotify.com" :user "client-id"))
    ;; optional: enable transient map for frequent commands
    (smudge-player-use-transient-map t)
    :config
    ;; optional: display current song in mode line
    (global-smudge-remote-mode)))
;; (message "Spotify credentials not found in auth-source. Smudge not loaded.")))

;; (setq smudge-transport 'connect)

;; Org download to insert screenshots from clipboard
(after! org-download
  (setopt org-download-method 'directory)
  (setopt org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
  (setopt org-download-image-org-width 600)
  (setopt org-download-link-format "[[file:%s]]\n"
          org-download-abbreviate-filename-function #'file-relative-name)
  (setopt org-download-link-format-function #'org-download-link-format-function-default))

(after! org
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("se" . "src elisp"))
  (add-to-list 'org-structure-template-alist '("sr" . "src ruby"))
  (add-to-list 'org-capture-templates
               '("d" "DR Code Snippet" entry
                 (file "~/org/dr_snippets.org")
                 "* %^{Title}\n%^{Description}p\n#+begin_src ruby\n%c\n#+end_src\n"))
  (add-to-list 'org-capture-templates
               '("s" "Schedule entry" entry
                 (file+datetree+prompt "~/org/schedule.org")
                 "* %^{Timecode}\nDescr: %^{Description}\nCLOCK: %^T--%^T \n:PROPERTIES:\n:TIMECODE: %\\1\n:END:")))
;; (add-to-list 'org-capture-templates
;; '("s" "Schedule entry" entry
;; (file+datetree+prompt "~/org/schedule.org")
;; "* %^{Timecode}\nDescr: %^{Description}\nSCHEDULED: <%<%Y-%m-%d %a %^{Time}>> \n:PROPERTIES:\n:TIMECODE: %\\1\n:END:")))


(use-package eglot-booster
  :after eglot
  :config (eglot-booster-mode))


;; (defun my/setup-project-three-window-layout ()
;;   "Create a 3-window layout for the current project.
;;    - Main window in center (larger)
;;    - Window on left
;;    - Window on right with first .org file found in project"
;;   (interactive)
;;   (when (projectile-project-p)
;;     (let* ((project-root (projectile-project-root))
;;            (org-files (directory-files-recursively project-root "\\.org$"))
;;            (first-org-file (car org-files)))

;;       ;; Start with a single window
;;       (delete-other-windows)

;;       ;; Create left window (30% width)
;;       (let ((left-window (split-window-horizontally (floor (* (window-width) 0.3)))))
;;         ;; Create right window from main window (leaves main in middle)
;;         (let ((main-window (selected-window))
;;               (right-window (split-window-horizontally (floor (* (window-width) 0.66)))))

;;           ;; Open org file in right window
;;           (when first-org-file
;;             (select-window right-window)
;;             (find-file first-org-file))

;;           ;; Go back to main window
;;           (select-window main-window)

;;           ;; Optional: Add a message if no org files found
;;           (unless first-org-file
;;             (message "No .org files found in project")))))))

;; (defun my/setup-project-three-window-layout ()
;;   "Create a 3-window layout for the current project with a larger middle window."
;; (interactive)
;; (when (projectile-project-p)
;;   (let* ((project-root (projectile-project-root))
;;          (org-files (directory-files-recursively project-root "\\.org$"))
;;          (first-org-file (car org-files)))

;;     ;; Start fresh with a single window
;;     (delete-other-windows)

;;     ;; First split creates left and temp-right
;;     (let ((left-window (split-window-horizontally (floor (* (window-width) 0.25)))))
;;       ;; Now create middle and right from the temp-right window
;;       (let ((middle-window (selected-window)))
;;         ;; Create right window (30% of total width)
;;         (split-window-horizontally (- (floor (* (window-total-width) 0.7))))

;;         ;; Select windows and open content
;;         (when first-org-file
;;           (windmove-right)
;;           (find-file first-org-file))

;;         ;; Return to middle window (which should be 45% of width)
;;         (select-window middle-window)

;;         ;; Display buffer list in left window
;;         (windmove-left)
;;         (list-buffers)

;;         ;; Return to middle window again
;;         (windmove-right)

;;         (message "Layout created: Left (25%%), Center (45%%), Right (30%%)")
;;         (when first-org-file
;;           (message "Opened org file: %s" first-org-file))
;; (unless first-org-file
;;   (message "No .org files found in project")))))))

;; (defun my/setup-project-three-window-layout ()
;;   "Create a 3-window layout for the current project with a larger middle window.
;;    Ensures the org file opens in the right window."
;;   (interactive)
;;   (when (projectile-project-p)
;;     (let* ((project-root (projectile-project-root))
;;            (org-files (directory-files-recursively project-root "\\.org$"))
;;            (first-org-file (car org-files))
;;            (total-width (frame-width))
;;            (left-size (floor (* total-width 0.25)))
;;            (right-size (floor (* total-width 0.30)))
;;      (middle-size (- total-width left-size right-size)))

;; ;; Start fresh with a single window
;; (delete-other-windows)

;; ;; Step 1: Create left and remaining window
;; (split-window-horizontally left-size)
;; (windmove-right)  ;; Move to the right (future middle+right area)

;; ;; Step 2: From the right portion, create middle and right windows
;; (let ((middle-window (selected-window)))
;;   (split-window-horizontally (- (window-width) right-size))

;;   ;; Step 3: Navigate to right window and open org file
;;   (windmove-right)
;;   (when first-org-file
;;     (find-file first-org-file))

;;   ;; Step 4: Navigate to left window and show buffer list
;;   (windmove-left)  ;; Go to middle
;;   (windmove-left)  ;; Go to left
;;   (list-buffers)

;;   ;; Step 5: Return to middle window for final position
;;   (windmove-right)  ;; Back to middle

;;   ;; Adjust window sizes if needed
;;   (balance-windows)

;;   ;; Report status
;;   (message "Layout created with org file on the right")
;;   (unless first-org-file
;;     (message "No .org files found in project"))))))


;; (defun my/setup-project-three-window-layout ()
;;   "Create a 3-window layout for the current project:
;;    - Left window (25%): vterm in project root
;;    - Middle window (45%): current buffer
;;    - Right window (30%): first .org file found"
;;   (interactive)
;;   (if (not (projectile-project-p))
;;       (message "Not in a project. Please open a project first.")
;;     (let* ((project-root (projectile-project-root))
;;            (org-files (directory-files-recursively project-root "\\.org$"))
;;            (first-org-file (car org-files))
;;            (current-buffer (current-buffer)))

;;       ;; Debugging info
;;       (message "Project root: %s" project-root)
;;       (message "Found org files: %d" (length org-files))
;;       (when first-org-file (message "Will open: %s" first-org-file))

;;       ;; Start fresh
;;       (delete-other-windows)

;;       ;; Remember current buffer
;;       (let ((original-buffer current-buffer))

;;         ;; Create left window (25%)
;;         (split-window-horizontally (floor (* (frame-width) 0.25)))

;;         ;; We're now in the right portion (75%)
;; Create right window (40% of remaining space, ~30% of total)
;; (split-window-horizontally (floor (* (window-width) 0.6)))

;; ;; Now configure each window with appropriate content

;; ;; 1. Configure right window with org file
;; (other-window 1)  ;; Move to right window
;; (when first-org-file
;;   (find-file first-org-file)
;;   (message "Opened org file in right window"))

;; ;; 2. Configure left window with vterm
;; (other-window 1)  ;; This will cycle to left window
;; (cd project-root)  ;; Ensure we're in project root
;; (call-interactively '+vterm/here)
;; (message "Opened vterm in left window")

;; ;; 3. Return to middle window and restore original buffer
;; (other-window 1)  ;; Back to middle
;; (switch-to-buffer original-buffer)
;; (message "Restored %s in middle window" (buffer-name original-buffer))))))
;;
;;
(defun my/grep-dr-docs ()
  "Grep through the /docs directory in the current project."
  (interactive "sSearch docs for: ")
  (let ((default-directory (locate-dominating-file default-directory "docs/")))
    (if default-directory
        (grep (concat "grep -r --include=\"*\" -n \"" search-term "\" ./docs/"))
      (message "No docs directory found in project!"))))

(map! :leader "z s" #'my/grep-dr-docs)


(defun my/setup-project-three-window-layout ()
  "Create a 3-window layout for the current project:
   - Left window (25%): vterm in project root
   - Middle window (45%): current buffer (preserved)
   - Right window (30%): first .org file found"
  (interactive)
  (if (not (projectile-project-p))
      (message "Not in a project. Please open a project first.")
    (let* ((project-root (projectile-project-root))
           (org-files (directory-files-recursively project-root "\\.org$"))
           (first-org-file (car org-files))
           (current-buffer (current-buffer)))

      ;; Start fresh
      (delete-other-windows)

      ;; Save original buffer
      (let ((original-buffer current-buffer))

        ;; First split - creates left window (active) and right portion
        (split-window-horizontally (floor (* (frame-width) 0.25)))

        ;; We're still in the LEFT window at this point
        ;; Configure left window with vterm
        (cd project-root)
        (call-interactively '+vterm/here)

        ;; Move to right portion
        (other-window 1)

        ;; Second split - divides right portion into middle and right windows
        (split-window-horizontally (floor (* (window-width) 0.6)))

        ;; We're now in the MIDDLE window
        ;; Ensure original buffer is restored here
        (switch-to-buffer original-buffer)

        ;; Move to right window
        (other-window 1)

        ;; Open org file in right window
        (when first-org-file
          (find-file first-org-file)
          (message "Opened org file in right window"))

        ;; Return to middle window for final position
        (other-window -1)

        (message "Layout complete with vterm (left), current buffer (middle), org file (right)")))))

;; Bind it to a key
(map! :leader "z 3" #'my/setup-project-three-window-layout)


(defun my/timecode-summary-by-day ()
  "Generate a summary of time spent by timecode for each day."
  (interactive)
  (let ((buf (get-buffer-create "*Timecode Daily Summary*"))
        (date-entries '())
        (start-date (org-read-date nil nil "-1w")) ;lastweek
        (end-date (org-read-date nil nil "+1w")))  ;thisweek end

    ;; Collect all clocked entries with timecodes in the date range
    (org-map-entries
     (lambda ()
       (let ((clocks (org-entry-get-multivalued-property (point) "CLOCK"))
             (timecode (org-entry-get (point) "TIMECODE")))
         (when (and clocks timecode)
           (dolist (clock clocks)
             (when (string-match org-ts-regexp-inactive clock)
               (let* ((start-time (match-string 1 clock))
                      (date (substring start-time 0 10)))
                 (when (and (string<= start-date date)
                            (string<= date end-date))
                   (if (string-match "=>\\s-*\\([0-9]+:[0-9]+\\)" clock)
                       (let ((duration (match-string 1 clock)))
                         (push (list date timecode duration) date-entries))))))))))
     nil
     (list (buffer-file-name)))

    ;; Process and display the results
    (with-current-buffer buf
      (erase-buffer)
      (org-mode)
      (insert "#+TITLE: Daily Timecode Summary\n\n")

      ;; Group by date
      (let ((dates (delete-dups (mapcar 'car date-entries))))
        (setq dates (sort dates 'string<))
        (dolist (date dates)
          (insert (format "* %s\n" date))
          (insert "| TIMECODE | Hours |\n")
          (insert "|----------+-------|\n")

          ;; Group by timecode for this date
          (let ((timecodes (make-hash-table :test 'equal)))
            (dolist (entry date-entries)
              (when (equal date (car entry))
                (let* ((tc (nth 1 entry))
                       (dur (nth 2 entry))
                       (minutes (org-duration-to-minutes dur))
                       (current (gethash tc timecodes 0)))
                  (puthash tc (+ current minutes) timecodes))))

            ;; Insert each timecode for this date
            (maphash (lambda (tc minutes)
                       (insert (format "| %s | %s |\n"
                                       tc
                                       (org-duration-from-minutes minutes))))
                     timecodes)

            ;; Calculate total
            (let ((total 0))
              (maphash (lambda (_ minutes) (setq total (+ total minutes))) timecodes)
              (insert "|----------+-------|\n")
              (insert (format "| *Total* | %s |\n\n"
                              (org-duration-from-minutes total))))))))

    (switch-to-buffer buf)
    (goto-char (point-min))))

;; I think this doesn't work because it's a doom emacs thing?
;; (setopt treesit-language-source-alist
;;         '((odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")))

;; (use-package! lsp-tailwindcss :after lsp-mode)
;; (defvar lsp-language-id-configuration
;; '((".*\\.html\\.erb$" . web-mode)))
;;   '((".*\\.html\\.erb$" . lsp-tailwindcss)))

;;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; (defun my/setup-ruby-eglot ()
;;   "Use eglot with ruby-lsp for Rails projects only."
;;   (when (and buffer-file-name
;;              (string-prefix-p (expand-file-name "~/code/rails/")
;;                               (expand-file-name buffer-file-name)))
;;     (setq-local eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp"))
;;     (eglot-ensure)))

;; (add-hook 'ruby-mode-hook #'my/setup-ruby-eglot)

(defun my/setup-project-two-window-layout ()
  "Create a 2-window layout for the current project:
   - Left window (50%): current file in project root
   - Right window (50%): first .org file found"
  (interactive)
  (if (not (projectile-project-p))
      (message "Not in a project. Please open a project first.")
    (let* ((project-root (projectile-project-root))
           (org-files (directory-files-recursively project-root "\\.org$"))
           (first-org-file (car org-files))
           (current-buffer (current-buffer)))

      ;; Start fresh
      (delete-other-windows)

      ;; Save original buffer
      (let ((original-buffer current-buffer))

        ;; First split - creates left window (active) and right portion
        ;; (split-window-horizontally (floor (* (frame-width) 0.25)))

        ;; We're still in the LEFT window at this point
        ;; Configure left window with vterm
        ;; (cd project-root)
        ;; (call-interactively '+vterm/here)

        ;; Move to right portion
        ;; (other-window 1)

        ;; Second split - divides right portion into middle and right windows
        (split-window-horizontally (floor (* (window-width) 0.5)))

        ;; We're now in the MIDDLE window
        ;; Ensure original buffer is restored here
        (switch-to-buffer original-buffer)

        ;; Move to right window
        (other-window 1)

        ;; Open org file in right window
        (when first-org-file
          (find-file first-org-file)
          (message "Opened org file in right window"))

        ;; Return to middle window for final position
        (other-window -1)

        (message "Layout updated, current buffer (left), org file (right)")))))

;; Bind it to a key
(map! :leader "z 2" #'my/setup-project-two-window-layout)

;; (after! lsp-mode
;;   (set-lsp-priority! 'ruby-lsp-ls 1)  ;; Higher priority
;;   (set-lsp-priority! 'ruby-ls 0))   ;; Lower priority
;; (setq wl-copy-process nil)
;; (defun wl-copy (text)
;;   (setq wl-copy-process (make-process :name "wl-copy"
;;                                       :buffer nil
;;                                       :command '("wl-copy" "-f" "-n")
;;                                       :connection-type 'pipe
;;                                       :noquery t))
;;   (process-send-string wl-copy-process text)
;;   (process-send-eof wl-copy-process))
;; (defun wl-paste ()
;;   (if (and wl-copy-process (process-live-p wl-copy-process))
;;       nil
;;     (shell-command-to-string "wl-paste -n | tr -d \r")))
;; (setq interprogram-cut-function 'wl-copy)
;; (setq interprogram-paste-function 'wl-paste)

;; (add-hook 'after-init-hook #'global-mise-mode)
(setq select-enable-primary t)
;; (use-package! xclip
;;   :config
;;   (setq xclip-program "wl-copy")
;;   (setq xclip-select-enable-clipboard t)
;;   (setq xclip-mode t)
;;   (setq xclip-method (quote wl-copy)))
