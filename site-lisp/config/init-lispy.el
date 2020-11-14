;;; init-lispy.el --- Settings for Lispy
;;; Code:
(leaf lispy
  :ensure t
  :hook emacs-lisp-mode-hook
  :config
  (lispy-mode)
  :bind
  ("C-' l" . lispy-mode))

(provide 'init-lispy)

;;; init-lispy.el ends here
