;;; This file is used for Python Configuration
;;; Indent
(setq-default python-indent-offset 2)

;;; Folding
(add-hook 'python-mode-hook '(lambda () (outline-minor-mode t)))

(provide 'init-python)
