;;; init-flycheck.el --- Settings for FlyCheck
;;; Code:
(leaf flycheck
  :ensure t
  :hook lsp-mode-hook
  :config
  (flycheck-mode)
  :bind ("C-' C-f" . flycheck-mode))

;;; Posframe Support for FlyCheck
(use-package flycheck-posframe
  :ensure t
  :hook flycheck-mode-hook
  :config
  (flycheck-posframe-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
