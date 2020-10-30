;;; This file is the Configuration About C/C++.

(setq-default c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "linux"))
              c-basic-offset 2)

(add-hook 'c-mode-hook '(lambda () (outline-minor-mode t)))

(provide 'init-cc)
