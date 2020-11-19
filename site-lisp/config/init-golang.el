;;; init-golang.el --- Settings for golang
;;; Code:
(use-package go-mode
  :ensure t
  :hook (lsp-hook . go-mode))

(provide 'init-golang)

;;; init-golang.el ends here
