;;; This file is used for Winner Mode Settings
(use-package winner-mode
  :hook (after-init-hook . winner-mode)
  :bind (("C-' C-w u" . winner-undo)
         ("C-' C-w r" . winner-redo)))

(provide 'init-winner-mode)
