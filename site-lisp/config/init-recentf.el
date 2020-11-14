;;; init-recentf.el --- Settings for RecentF
;;; Code:
(leaf recentf
  :hook after-init-hook
  :config
  (recentf-mode)
  :bind
  ("C-' r" . recentf-open-files))

(provide 'init-recentf)

;;; init-recentf.el ends here
