;;; init-indent-guide.el --- Settings for indent guide
;;; Code:
(use-package indent-guide
  :ensure t
  :hook (prog-mode-hook . indent-guide-global-mode))

(provide 'init-indent-guide)

;;; init-indent-guide.el ends here
