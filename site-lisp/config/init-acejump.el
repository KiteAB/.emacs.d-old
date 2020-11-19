;;; init-acejump.el --- Settings for acejump
;;; Code:
(use-package ace-jump-mode
  :ensure t
  :bind (("C-' C-a SPC" . ace-jump-mode)
         ("C-' C-a w" . ace-jump-word-mode)
         ("C-' C-a c" . ace-jump-char-mode)))

(provide 'init-acejump)

;;; init-acejump.el ends here
