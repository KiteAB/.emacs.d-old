;;; init-info-colors.el --- Settings for info colors
;;; Code:
(use-package info-colors
  :ensure t
  :hook (Info-selection-hook . info-colors-fontify-node))

(provide 'init-info-colors)

;;; init-info-colors.el ends here
