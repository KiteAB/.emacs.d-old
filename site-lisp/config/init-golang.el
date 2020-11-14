;;; init-golang.el --- Settings for Golang
;;; Code:
(leaf go-mode
  :ensure t
  :hook lsp-mode-hook
  :config
  (go-mode))

(provide 'init-golang)

;;; init-golang.el ends here
