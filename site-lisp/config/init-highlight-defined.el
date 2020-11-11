;;; This file is used for Highlight Defined Settings
(use-package highlight-defined
  :ensure t
  :hook (emacs-lisp-mode-hook . highlight-defined-mode)
  :config
  (set-face-attribute 'highlight-defined-function-name-face nil :foreground "Blue"))

(provide 'init-highlight-defined)
