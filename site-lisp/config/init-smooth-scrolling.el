;;; init-smooth-scrolling.el --- Settings for smooth scrolling
;;; Code:
(use-package smooth-scrolling
  :ensure t
  :hook (after-init-hook . smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 3))

(provide 'init-smooth-scrolling)

;;; init-smooth-scrolling.el ends here
