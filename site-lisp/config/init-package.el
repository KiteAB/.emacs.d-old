;;; init-package.el --- Settings for packages
;;; Code:
;; Set Parent Key for Packages
(define-prefix-command 'package-command)
(global-set-key (kbd "C-'") 'package-command)

;; Init Packages
(package-initialize)

;; Mirror Source
(require 'package)
(require 'cl-lib)
(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;; Init Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-hook-name-suffix nil)
(setq use-package-always-defer t)

(provide 'init-package)

;;; init-package.el ends here
