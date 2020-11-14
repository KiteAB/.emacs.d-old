;;; This file is used for Symbol Overlay Settings
(use-package symbol-overlay
  :ensure t
  :hook (emacs-lisp-mode-hook . symbol-overlay-mode))

(provide 'init-symbol-overlay)
