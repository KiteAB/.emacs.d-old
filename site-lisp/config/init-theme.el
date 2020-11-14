;;; init-theme.el --- Settings for Theme
;;; Code:
;;; Lazycat Theme
(leaf lazycat-theme
  :load-path "~/.emacs.d/site-lisp/extensions/lazycat-theme/"
  :require t
  :config
  (load-theme 'lazycat-dark t))

;;; Circadian - Switch Theme
(leaf circadian
  :ensure t
  :disabled t
  :config
  (circadian-setup)
  :custom
  (calendar-latitude . 27.831940)
  (calendar-longitude . 113.148087)
  (circadian-themes . '((:sunrise . lazycat-light)
                        (:sunset . lazycat-dark))))

(provide 'init-theme)

;;; init-theme.el ends here
