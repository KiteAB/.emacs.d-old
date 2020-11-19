;;; init-highlight-quoted.el --- Settings for highlight quoted
;;; Code:
(use-package highlight-quoted
  :ensure t
  :hook (emacs-lisp-mode-hook . highlight-quoted-mode))

(provide 'init-highlight-quoted)

;;; init-highlight-quoted.el ends here
