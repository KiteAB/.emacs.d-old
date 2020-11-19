;;; init-symbol-overlay.el --- Settings for symbol overlay
;;; Code:
(use-package symbol-overlay
  :ensure t
  :hook (emacs-lisp-mode-hook . symbol-overlay-mode))

(provide 'init-symbol-overlay)

;;; init-symbol-overlay.el ends here
