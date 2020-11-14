;;; init-smooth-scrolling.el --- Settings for Smooth Scrolling
;;; Code:
(leaf smooth-scrolling
  :ensure t
  :hook after-init-hook
  :config
  (smooth-scrolling-mode)
  :custom
  (smooth-scroll-margin . 3))

(provide 'init-smooth-scrolling)

;;; init-smooth-scrolling.el ends here
