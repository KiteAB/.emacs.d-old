;;; This file is used for Multiple Cursors Settings
(use-package multiple-cursors
  :ensure t
  :bind (("C-M-l" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-m" . newline)))

(provide 'init-multiple-cursors)
