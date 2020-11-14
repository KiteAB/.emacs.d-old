;;; init-python.el --- Settings for Python
;;; Code:
;;; Indent
(setq-default python-indent-offset 2)

;;; Folding
(add-hook 'python-mode-hook '(lambda () (outline-minor-mode t)))

(provide 'init-python)

;;; init-python.el ends here
