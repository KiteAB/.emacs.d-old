;;; This file is used for Golang Settings
(use-package go-mode
  :ensure t
  :hook (lsp-hook . go-mode))

(provide 'init-golang)
