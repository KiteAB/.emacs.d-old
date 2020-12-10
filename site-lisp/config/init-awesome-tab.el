;;; init-awesome-tab.el --- Settings for awesome tab
;;; Code:
(use-package awesome-tab
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tab"
  :init
  (define-prefix-command 'awesome-tab-key)
  (global-set-key (kbd "C-,") 'awesome-tab-key))

(provide 'init-awesome-tab)

;;; init-awesome-tab.el ends here
