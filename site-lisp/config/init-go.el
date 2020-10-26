;;; This file is used for Golang Settings
(use-package go-mode
  :ensure t
  :hook (go-mode-hook . lsp))

(provide 'init-go)
