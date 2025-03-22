;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq custom-file (locate-user-emacs-file "custom-gui.el"))
(load custom-file :no-error-if-file-is-missing)


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
(setq doom-font (font-spec :family "FiraCode" :size 13.0 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "FiraSans" :size 13.0 :weight 'Regular)
      doom-symbol-font (font-spec :famil "FiraCode" :size 13.0))

(setq nerd-icons-font-family "FiraCode")
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
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil)
modus-themes-completions
'((matches . (extrabold))
  (selection . (semibold italic text-also)))
(setq modus-themes-disable-other-themes t)
(setq doom-theme 'modus-vivendi)
;;(load-theme 'modus-vivendi :no-confirm)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; (use-package nov-xwidget
;;   :demand t
;;   :after nov
;;   :config
;;   (define-key nov-mode-map (kbd "o") 'nov-xwidget-view)
;;   (add-hook 'nov-mode-hook 'nov-xwidget-inject-all-files))
;; ;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
;;
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
(use-package! odin-ts-mode
  :mode ("\\.odin\\'" . odin-mode))
;;:hook (odin-ts-mode . eglot))

;; Add OLS to the list of available programs
;; NOTE: As of Emacs 30, this is not needed.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((odin-ts-mode) . ("ols"))))

;; Add a hook to autostart OLS
;;(add-hook 'odin-mode-hook #'eglot-ensure)
(add-hook 'odin-ts-mode-hook #'eglot-ensure) ;; If you're using the TS mode


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
