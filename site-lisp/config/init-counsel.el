;;; init-counsel.el --- Settings for counsel
;;; Code:
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)))

(use-package smex :ensure t) ; History remember for counsel-M-x

(provide 'init-counsel)

;;; init-counsel.el ends here
