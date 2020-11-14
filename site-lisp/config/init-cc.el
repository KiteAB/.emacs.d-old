;;; init-cc.el --- Settings for C/C++ Programming
;;; Code:
(setq-default c-basic-offset 2
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "linux")))

(add-hook 'c-mode-hook '(lambda () (outline-minor-mode t)))

(provide 'init-cc)

;;; init-cc.el ends here
