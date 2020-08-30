;;;; This file is used for other modes
;; Dired-mode
(require 'dired-x) ; Use dired-x to add the `C-x C-j` keymap
(put 'dired-find-alternate-file 'disabled nil) ; Don't let dired-mode create a new buffer for the dir
(with-eval-after-load 'dired
	(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; Abbrev-mode
(setq-default abbrev-mode t) ; Open abbrev-mode
(define-abbrev-table
	'global-abbrev-table
	'(("MyName" "SpringHan")
		("MyEmail" "<springchohaku@qq.com>")
		("Copyright" "Copyright (C) <+++> SpringHan")))

;; Eshell-mode
(add-hook 'eshell-mode-hook (lambda () (linum-mode -1)))
(setq eshell-aliases-file "~/.emacs.d/eshell-aliases")

(provide 'init-modes)
