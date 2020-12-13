;;; init-xah-fly-keys.el --- Settings for xah fly keys
;;; Code:
(use-package xah-fly-keys
  :ensure t
  :hook (after-init-hook . xah-fly-keys)
  :config
  (xah-fly-keys-set-layout "colemak")
  (define-key xah-fly-insert-map [escape] #'xah-fly-command-mode-activate))

(provide 'init-xah-fly-keys)

;;; init-xah-fly-keys.el ends here
