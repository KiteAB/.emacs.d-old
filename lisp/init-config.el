;;; This file is used for Require Features
;;; Autoload
(require '+autoload)
;;; Configuration of Function
(require '+config)

;;; Basic Settings About Packages
(require 'init-elpa)
;;; User Interface
(require 'init-ui)
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
;;; WhiteSpace
(require 'init-whitespace)
;;; Other Programming Language's Settings
(require 'init-prog)
;;; English
(require 'init-english)
;;; Dired
(require 'init-dired)
;;; PYIM
(require 'init-pyim)
;;; Org Mode
(require 'init-org)

;;; Other Mode Settings
(require 'init-modes)
;;; Macros
(require 'init-macros)

;;; GitHub (Markdown Preview)
(if (file-exists-p "~/.emacs.d/token.el")
    (progn
      (load-file "~/.emacs.d/token.el")
      (require 'gh-token))
  (switch-to-buffer "*KiteAB Emacs*")
  (insert "[KiteAB Emacs] token.el not found. Please check it or ignore this message at init-config.el")
  (switch-to-buffer-other-window "*KiteAB Emacs*"))

;;; Languages Settings
(require 'init-python)
(require 'init-cc)

(provide 'init-config)
