;;; This file is used for Hydra configuration
(define-prefix-command 'leader-key)
(which-key-add-key-based-replacements
  )
(global-set-key (kbd "M-SPC") 'leader-key)

(use-package hydra :ensure t)

(use-package hydra-posframe
  :load-path "~/.emacs.d/site-lisp/hydra-posframe"
  :hook (after-init-hook . hydra-posframe-mode))

(provide 'init-hydra)
