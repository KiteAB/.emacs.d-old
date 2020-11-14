;;; init-highlight-defined.el --- Settings for Highlight Defined
;;; Code:
(leaf highlight-defined
  :ensure t
  :hook emacs-lisp-mode-hook
  :config
  (highlight-defined-mode)
  (set-face-attribute 'highlight-defined-function-name-face nil :foreground "Blue"))

(provide 'init-highlight-defined)

;;; init-highlight-defined.el ends here
