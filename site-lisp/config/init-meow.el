;;; init-meow.el --- Settings for meow
;;; Code:
(use-package meow
  :ensure t
  :demand
  :hook (after-init-hook . meow-global-mode)
  :config
  (setq meow-layout 'colemak))

(provide 'init-meow)

;;; init-meow.el ends here
