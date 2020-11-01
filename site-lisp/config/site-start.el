;;; This file is used for Require Features
(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))
  (with-temp-message ""
    (require 'init-functions)
    (require 'init-elpa)
    (require 'init-ui)
    (require 'init-awesome-tray)

    (require 'init-basic)
    (require 'init-keybindings)

    (require 'init-complete)
    (require 'init-lsp)
    (require 'init-emacs-lisp)
    (require 'init-tools)
    (require 'init-git)
    (require 'init-treemacs)
    (require 'init-yasnippet)
    (require 'init-ivy)
    (require 'init-pyim)
    (require 'init-whitespace)
    (require 'init-eaf)
    (require 'init-prog)
    (require 'init-english)
    (require 'init-dired)
    (require 'init-org)

    (require 'init-modes)
    (require 'init-macros)

    (if (file-exists-p "~/.emacs.d/site-lisp/config/init-token.el")
        (progn
          (load-file "~/.emacs.d/site-lisp/config/init-token.el")
          (require 'gh-token))
      (switch-to-buffer "*KiteAB Emacs*")
      (insert "[WARNING] token.el not found. Please read README.org's \"Token\" part or ignore this message at init-config.el"))

    (require 'init-python)
    (require 'init-cc)
    (require 'init-go)
    ))

(provide 'site-start)
