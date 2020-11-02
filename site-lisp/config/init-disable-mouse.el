;;; This file is used for Disable Mouse Settings
(use-package disable-mouse
  :ensure t
  :hook (after-init-hook . global-disable-mouse-mode))

(provide 'init-disable-mouse)
