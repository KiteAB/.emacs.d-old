;;; init-lispy.el --- Settings for lispy
;;; Code:
(use-package lispy
  :ensure t
  :hook (emacs-lisp-mode-hook . lispy-mode)
  :bind ("C-' l" . lispy-mode))

(provide 'init-lispy)

;;; init-lispy.el ends here
