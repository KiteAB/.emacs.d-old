;;; init-vterm.el --- Settings for vterm
;;; Code:
(use-package vterm
  :ensure t
  :config
  (define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
  (define-key vterm-mode-map (kbd "C-c n") 'next-buffer))

(provide 'init-vterm)

;;; init-vterm.el ends here
