;;; init-highlight-defined.el --- Settings for highlight defined
;;; Code:
(use-package highlight-defined
  :ensure t
  :hook (emacs-lisp-mode-hook . highlight-defined-mode)
  :config
  (set-face-attribute 'highlight-defined-function-name-face nil :foreground "Blue"))

(provide 'init-highlight-defined)

;;; init-highlight-defined.el ends here
