;;; This file is used for Golang Mode Settings
(use-package go-mode
  :ensure t
  :hook (lsp-hook . go-mode))

(provide 'init-go-mode)
