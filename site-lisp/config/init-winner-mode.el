;;; init-winner-mode.el --- Settings for Winner Mode
;;; Code:
(leaf winner-mode
  :hook after-init-hook
  :config
  (winner-mode)
  :bind
  ("C-' C-w u" . winner-undo)
  ("C-' C-w r" . winner-redo))

(provide 'init-winner-mode)

;;; init-winner-mode.el ends here
