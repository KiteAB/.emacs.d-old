;;;; This file is used for other modes
;; Dired-mode
(require 'dired-x) ; Use dired-x to add the `C-x C-j` keymap
(put 'dired-find-alternate-file 'disabled nil) ; Don't let dired-mode create a new buffer for the dir
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; Hooks
(add-hook 'markdown-mode-hook #'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook #'(lambda () (display-line-numbers-mode -1) (whitespace-mode -1))) ; Disable line numbers and whitespace in ERC
(add-hook 'magit-mode-hook #'(lambda () (define-key magit-mode-map "q" 'kiteab/kill-magit))) ; Clear buffer about Magit
(add-hook 'emacs-lisp-mode-hook #'(lambda () (outline-minor-mode t)))
(add-hook 'web-mode-hook #'(lambda () (outline-minor-mode t)))

;; Abbrev-mode
(setq-default abbrev-mode t) ; Open abbrev-mode
(define-abbrev-table
  'global-abbrev-table
  '(("myname" "KiteAB")
    ("myemail" "<kiteabpl@outlook.com>")
    ("copyr" "Copyright (C) <+++> KiteAB")))

(provide 'init-modes)
