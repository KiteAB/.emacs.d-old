;;; This file is used for VTerm Settings
(use-package vterm
  :ensure t
  :disabled
  :config
  (define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
  (define-key vterm-mode-map (kbd "C-c n") 'next-buffer))

(provide 'init-vterm)
