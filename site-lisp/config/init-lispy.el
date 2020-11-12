;;; This file is used for Lispy Settings
(use-package lispy
  :ensure t
  :hook (emacs-lisp-mode-hook . lispy-mode)
  :bind ("C-' l" . lispy-mode))

(provide 'init-lispy)
