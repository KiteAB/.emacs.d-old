;;; This file is used for Lispy Settings
(use-package lispy
  :ensure t
  :defer
  ;; :hook ((lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook) . lispy-mode)
  :bind ("C-' L" . lispy-mode))

(provide 'init-lispy)
