;;; init.el --- Require features
;;; Code:
;; Preparation
(require 'init-accelerate)
(require 'init-font)

(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))
  (with-temp-message ""
    ;; Basic
    (require 'init-generic)
    (require 'init-package)
    (require 'init-macros)
    (require 'init-time)
    (require 'init-modes)
    (require 'init-functions)

    ;; Basic User Interface
    (require 'init-ui)
    (require 'init-awesome-tray)
    (require 'init-theme)

    ;; Keybinding
    (require 'init-keybind)
    (require 'init-xfk)

    ;; Package
    ;; Org
    (require 'init-org)

    ;; Emacs Lisp
    (require 'init-awesome-pair)
    (require 'init-symbol-overlay)
    (require 'init-highlight-defined)
    (require 'init-highlight-quoted)
    ;; (require 'init-rainbow-delimiters)
    ;; (require 'init-lispy)

    ;; Auto Complete
    (require 'init-company-mode)
    (require 'init-lsp)
    (require 'init-elpy)

    ;; Project
    (require 'init-projectile)
    (require 'init-treemacs)

    ;; Programming
    (require 'init-cc)
    (require 'init-golang)
    (require 'init-python)
    (require 'init-web-mode)
    (require 'init-yaml-mode)

    ;; Tool
    (require 'init-ace-jump)
    (require 'init-ace-window)
    (require 'init-aggressive-indent)
    (require 'init-auto-save)
    (require 'init-multiple-cursors)
    (require 'init-auto-sudoedit)
    (require 'init-nerd-commenter)
    (require 'init-pacarch)
    (require 'init-clm)
    (require 'init-paren-face)
    (require 'init-comment)
    (require 'init-company-eh)
    (require 'init-counsel)
    (require 'init-dired)
    (require 'init-disable-mouse)
    (require 'init-eaf)
    (require 'init-flycheck)
    (require 'init-git)
    (require 'init-indent-guide)
    (require 'init-info-colors)
    (require 'init-insert-translated-name)
    (require 'init-isearch)
    (require 'init-ivy)
    (require 'init-license-templates)
    (require 'init-popwin)
    (require 'init-rainbow-mode)
    (require 'init-recentf)
    (require 'init-smooth-scrolling)
    (require 'init-which-key)
    (require 'init-whitespace)
    (require 'init-windresize)
    (require 'init-winner-mode)
    (require 'init-yasnippet)
    (require 'init-youdao-dict)
    ;; (require 'init-vterm)

    ;; Scratch
    (require 'init-scratch)

    ;; Can be delayed features
    (run-with-idle-timer
     1 nil
     #'(lambda ()
         ;; Session
         (require 'init-session)
         (emacs-session-restore)

         ;; Server
         (server-start)
         ))))

(provide 'init)

;;; init.el ends here
