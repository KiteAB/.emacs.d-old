;;; This file is used for Recentf Settings
(use-package recentf
  :hook (after-init-hook . recentf-mode)
  :bind ("C-' r" . recentf-open-files))

(provide 'init-recentf)
