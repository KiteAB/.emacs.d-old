;;; This file is used for Theme Settings
;;; Lazycat Themes
(use-package lazycat-theme
  :load-path "~/.emacs.d/site-lisp/extensions/lazycat-theme"
  :config
  (load-theme 'lazycat-dark t))

;;; Circadian - Switch Theme
(use-package circadian
  :ensure t
  :disabled
  :config
  (setq calendar-latitude 27.831940
        calendar-longitude 113.148087)
  (setq circadian-themes '((:sunrise . lazycat-light)
                           (:sunset . lazycat-dark)))
  (circadian-setup))

(provide 'init-theme)
