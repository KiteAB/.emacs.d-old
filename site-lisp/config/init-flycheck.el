;;; init-flycheck.el --- Settings for flycheck
;;; Code:
(use-package flycheck
  :ensure t
  :hook (lsp-mode-hook . flycheck-mode)
  :bind ("C-' C-f" . flycheck-mode))

(use-package flycheck-posframe
  :ensure t
  :hook (flycheck-mode-hook . flycheck-posframe-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
