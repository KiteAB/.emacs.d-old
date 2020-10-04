;;; This file is used for Evil Configuration
(use-package evil
	:ensure t
;	:hook (after-init-hook . evil-mode)
	)
;;; Child Package
(use-package undo-tree :ensure t)

(provide 'init-evil)
