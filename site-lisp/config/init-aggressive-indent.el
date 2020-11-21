;;; init-aggressive-indent.el --- Settings for aggressive indent
;;; Code:
(use-package aggressive-indent
  :ensure t
  :hook (emacs-lisp-mode-hook . aggressive-indent-mode))

(provide 'init-aggressive-indent)

;;; init-aggressive-indent.el ends here
