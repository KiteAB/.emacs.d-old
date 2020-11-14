;;; This file is used for Info Color Settings
(use-package info-colors
  :ensure t
  :hook (Info-selection-hook . info-colors-fontify-node))

(provide 'init-info-colors)
