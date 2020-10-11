;;; This file is used for Hydra configuration
;; <TODO(KiteAB)> https://github.com/EvanMeek/.emacs.d/blob/master/etc/config/init-keybind.el [Sat Oct 10 18:59:41 2020]
(define-prefix-command 'leader-key)
(global-set-key (kbd "M-SPC") 'leader-key)

(use-package hydra :ensure t)

(use-package hydra-posframe
  :load-path "~/.emacs.d/site-lisp/hydra-posframe"
  :hook (after-init-hook . hydra-posframe-mode))

(use-package major-mode-hydra
  :ensure t
  :after hydra)

(provide 'init-hydra)
