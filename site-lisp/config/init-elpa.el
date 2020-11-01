;;; This file is used for Packages Configuration and More
;;; Set Parent Key for Packages
(define-prefix-command 'plugin-key)
(global-set-key (kbd "C-'") 'plugin-key)

;;; Mirror Source
(require 'package)
(require 'cl-lib) ; Common Lisp
(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;;; Init Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-hook-name-suffix nil)

(provide 'init-package)
