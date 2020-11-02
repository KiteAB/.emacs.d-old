;;; This file is used for Smooth Scrolling Settings
(use-package smooth-scrolling
  :ensure t
  :hook (after-init-hook . smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 3))

(provide 'init-smooth-scrolling)
