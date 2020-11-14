;;; init-highlight-quoted.el --- Settings for Highlight Quoted
;;; Code:
(leaf highlight-quoted
  :ensure t
  :hook emacs-lisp-mode-hook
  :config
  (highlight-quoted-mode))

(provide 'init-highlight-quoted)

;;; init-highlight-quoted.el ends here
