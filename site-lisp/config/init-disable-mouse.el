;;; init-disable-mouse.el --- Settings for disable mouse
;;; Code:
(use-package disable-mouse
  :ensure t
  :hook (after-init-hook . global-disable-mouse-mode))

(provide 'init-disable-mouse)

;;; init-disable-mouse.el ends here
