;;; init-ace-jump.el --- Settings for ace jump
;;; Code:
(use-package ace-jump-mode
  :ensure t
  :bind (("C-' C-a SPC" . ace-jump-mode)
         ("C-' C-a w" . ace-jump-word-mode)
         ("C-' C-a c" . ace-jump-char-mode)))

(provide 'init-ace-jump)

;;; init-ace-jump.el ends here
