;;; init-symbol-overlay.el --- Settings for Symbol Overlay
;;; Code:
(leaf symbol-overlay
  :ensure t
  :hook emacs-lisp-mode-hook
  :config
  (symbol-overlay-mode))

(provide 'init-symbol-overlay)

;;; init-symbol-overlay.el ends here
