;;; init-info-colors.el --- Settings for Info Colors
;;; Code:
(leaf info-colors
  :ensure t
  :hook Info-selection-hook
  :config
  (info-colors-fontify-node))

(provide 'init-info-colors)

;;; init-info-colors ends here
