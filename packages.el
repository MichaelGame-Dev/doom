;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))
(package! robe)
(package! nov-xwidget
  :recipe (:host github :repo "chenyanming/nov-xwidget"))

(package! keycast)

(package! odin-mode
  :recipe (:host github :repo "mattt-b/odin-mode"))

(package! odin-ts-mode
  :recipe (:host github :repo "Sampie159/odin-ts-mode"))
;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)
(package! nerd-icons

  :recipe (:host github :repo "rainstormstudio/nerd-icons.el"
           :files (:defaults "data")))
;; :custom
;; ;; The Nerd Font you want to use in GUI
;; ;; "Symbols Nerd Font Mono" is the default and is recommended
;; ;; but you can use any other Nerd Font if you want
;; (nerd-icons-font-family "FiraCode")
;; )
(package! org-remark)
(package! denote)
(package! modus-themes)


(package! persist-text-scale
  :recipe
  (:host github :repo "jamescherti/persist-text-scale.el"))
(package! websocket)

;; (use-package obs-websocket
;;   :load-path "lisp/obs-websocket")

(package! obs-websocket
  :recipe (:host github :repo "sachac/obs-websocket-el"))
(package! smudge)


(package! eglot-booster
  :recipe (:host github :repo "jdtsmith/eglot-booster"))
(package! org-timeblock)
;; (package! ox-hugo)
;;
;; (package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! mise)
;; (package! xclip)
(package! yari :recipe (:host github :repo "hron/yari.el"))

(package! astro-ts-mode)
