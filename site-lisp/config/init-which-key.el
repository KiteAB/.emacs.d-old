;;; This file is used for Which Key Settings
(use-package which-key
  :ensure t
  :hook (after-init-hook . which-key-mode)
  :config (setq which-key-idle-delay 0.65))

(provide 'init-which-key)
