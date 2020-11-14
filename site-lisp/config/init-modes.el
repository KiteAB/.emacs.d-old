;;; init-modes.el --- Settings for Other Modes
;;; Code:
;;; Hooks
(add-hook 'markdown-mode-hook 'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook '(lambda () (display-line-numbers-mode -1) (whitespace-mode -1))) ; Disable line numbers and whitespace in ERC
(add-hook 'emacs-lisp-mode-hook '(lambda () (outline-minor-mode t) (prettify-symbols-mode t)))
(add-hook 'web-mode-hook '(lambda () (outline-minor-mode t)))

;;; Abbrev Mode
(setq-default abbrev-mode t) ; Open abbrev-mode
(define-abbrev-table
  'global-abbrev-table
  '(("myname" "KiteAB")
    ("myemail" "<kiteabpl@outlook.com>")
    ("copyr" "Copyright (C) <+++> KiteAB")))

(provide 'init-modes)

;;; init-modes.el ends here
