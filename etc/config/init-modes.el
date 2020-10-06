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
  '(("myname" "KiteAB")
    ("myemail" "<kiteabpl@outlook.com>")
    ("copyr" "Copyright (C) <+++> KiteAB")))

(provide 'init-modes)
