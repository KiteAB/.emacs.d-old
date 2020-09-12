;;;; This file is used for python configuration

;;; Indent
(setq python-indent-offset 2)

;;; Completing
(use-package lsp-pyright
	:ensure t
	:hook (python-mode-hook . (lambda () (require 'lsp-pyright) (lsp)))
	:config (when (executable-find "python3")
						(setq lsp-pyright-python-executable-cmd "python3")))

(provide 'kiteab-python)
