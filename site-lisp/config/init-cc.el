;;; init-cc.el --- Settings for C/C++
;;; Code:

(setq-default c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "linux"))
              c-basic-offset 2)

(add-hook 'c-mode-hook '(lambda () (outline-minor-mode t)))

(provide 'init-cc)

;;; init-cc.el ends here
