;;; This file is used for require the configuration files
;;; Configuration of Function
(require '+config)
;;; Package Settings
(require 'init-elpa)

;;; User Interface
(require 'init-ui)
;;; Basic Things
(require 'init-basic)
;;; Keybindings
(require 'init-keybindings)
;;; Ivy
(require 'init-ivy)
;;; Tools Settings
(require 'init-tools)
;;; Completion Settings
(require 'init-complete)
;;; Program Settings
(require 'init-prog)
;;; Emacs Lisp Mode
(require 'init-emacs-lisp)
;;; Git
(require 'init-git)
;;; Org Mode
(require 'init-org)
;;; Treemacs
(require 'init-treemacs)
;;; Other Mode Settings
(require 'init-modes)
;;; Macros
(require 'init-macros)
;;; Aliases
(require 'init-aliases)

;;; GitHub (Markdown Preview)
(if (file-exists-p "~/.emacs.d/token.el")
    (progn
      (load-file "~/.emacs.d/token.el")
      (require 'gh-token))
  (switch-to-buffer "*Warning*")
  (insert "token.el not found. Please check it or ignore this message at init-config.el")
  (switch-to-buffer-other-window "*Warning*"))

;;; Languages settings
(require 'init-python)
(require 'init-cc)

(provide 'init-config)
