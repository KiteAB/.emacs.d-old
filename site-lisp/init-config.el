;;; This file is used for Require Features
;;; Functions
(require 'init-functions)
;;; Basic Settings About Packages
(require 'init-elpa)
;;; User Interface
(require 'init-ui)
;;; Awesome Tray
(require 'init-awesome-tray)

;;; Basic Things
(require 'init-basic)
;;; Keybindings
(require 'init-keybindings)

;;; Complete
(require 'init-complete)
(require 'init-lsp)
;;; Emacs Lisp
(require 'init-emacs-lisp)
;;; Tools
(require 'init-tools)
;;; Git
(require 'init-git)
;;; Treemacs
(require 'init-treemacs)
;;; Yasnippet
(require 'init-yasnippet)
;;; Ivy
(require 'init-ivy)
;;; PYIM
(require 'init-pyim)
;;; WhiteSpace
(require 'init-whitespace)
;;; Other Programming Language's Settings
(require 'init-prog)
;;; English
(require 'init-english)
;;; Dired
(require 'init-dired)
;;; Org Mode
(require 'init-org)

;;; Other Mode Settings
(require 'init-modes)
;;; Macros
(require 'init-macros)

;;; GitHub (Markdown Preview)
(if (file-exists-p "~/.emacs.d/site-lisp/config/init-token.el")
    (progn
      (load-file "~/.emacs.d/site-lisp/config/init-token.el")
      (require 'gh-token))
  (switch-to-buffer "*KiteAB Emacs*")
  (insert "[KiteAB Emacs] token.el not found. Please read README.org's \"Token\" part or ignore this message at init-config.el"))

;;; Languages Settings
(require 'init-python)
(require 'init-cc)
(require 'init-go)

(provide 'init-config)
