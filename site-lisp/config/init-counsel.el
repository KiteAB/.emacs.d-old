;;; init-counsel.el --- Settings for Counsel
;;; Code:
(leaf counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x b" . counsel-switch-buffer))

(leaf smex :ensure t) ; History remember for counsel-M-x

(provide 'init-counsel)

;;; init-counsel.el ends here
