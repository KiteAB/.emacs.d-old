;;;; This file is used for packages configuration and more
;;; Set the plugin keybinding
(define-prefix-command 'plugin-key)
(define-prefix-command 'plugin-key-2)
(global-set-key (kbd "C-'") 'plugin-key)
(global-set-key (kbd "C--") 'plugin-key-2)

;;; Init Packages
(package-initialize)

;;; Mirror
(require 'package)
(require 'cl-lib) ; Common Lisp
(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;;; Init Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-hook-name-suffix nil)

(provide 'init-elpa)
