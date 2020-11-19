;;; init-winner-mode.el --- Settings for winner mode
;;; Code:
(use-package winner-mode
  :hook (after-init-hook . winner-mode)
  :bind (("C-' C-w u" . winner-undo)
         ("C-' C-w r" . winner-redo)))

(provide 'init-winner-mode)

;;; init-winner-mode.el ends here
