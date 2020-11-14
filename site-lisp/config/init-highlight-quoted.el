;;; This file is used for Highlight Quoted Settings
(use-package highlight-quoted
  :ensure t
  :hook (emacs-lisp-mode-hook . highlight-quoted-mode))

(provide 'init-highlight-quoted)
