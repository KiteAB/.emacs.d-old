;;; init-which-key.el --- Settings for Which Key
;;; Code:
(leaf which-key
  :ensure t
  :hook after-init-hook
  :config
  (which-key-mode)
  :custom
  (which-key-idle-delay . 0.65))

(provide 'init-which-key)

;;; init-which-key.el ends here
