;;; init-rainbow-mode.el --- Settings for rainbow mode
;;; Code:
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode-hook . rainbow-mode))

(provide 'init-rainbow-mode)

;;; init-rainbow-mode.el ends here
