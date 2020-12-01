;;; init-recentf.el --- Settings for recentf
;;; Code:
(use-package recentf
  :hook (after-init-hook . recentf-mode)
  :bind ("C-' r" . recentf-open-files)
  :config
  (add-to-list 'recentf-filename-handlers 'abbreviate-file-name))

(provide 'init-recentf)

;;; init-recentf.el ends here
