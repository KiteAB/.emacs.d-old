;;; init-disable-mouse.el --- Settings for Disable Mouse
;;; Code:
(leaf disable-mouse
  :ensure t
  :hook after-init-hook
  :config
  (disable-mouse-global-mode))

(provide 'init-disable-mouse)

;;; init-disable-mouse.el ends here
