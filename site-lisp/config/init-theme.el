;;; init-theme.el --- Settings for theme
;;; Code:
;; Lazycat Themes
(use-package lazycat-theme
  :load-path "~/.emacs.d/site-lisp/extensions/lazycat-theme"
  :demand
  :config
  (load-theme 'lazycat-dark t))

;; Circadian
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

;;; init-theme.el ends here
