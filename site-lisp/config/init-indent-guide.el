;;; init-indent-guide.el --- Settings for Indent Guide
;;; Code:
(leaf indent-guide
  :ensure t
  :hook after-init-hook
  :config
  (indent-guide-global-mode))

(provide 'init-indent-guide)

;;; init-indent-guide.el ends here
