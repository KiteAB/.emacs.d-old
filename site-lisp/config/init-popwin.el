;;; init-popwin.el --- Settings for Popwin
;;; Code:
(leaf popwin
  :ensure t
  :hook after-init-hook
  :config
  (popwin-mode))

(provide 'init-popwin)

;;; init-popwin.el ends here
