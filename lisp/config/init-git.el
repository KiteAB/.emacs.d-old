;;; This file is used for Git Settings
;;; Vc Message
(use-package vc-msg
  :ensure t
  :bind ("C-' s" . vc-msg-show))

;;; Magit
(use-package magit
  :ensure t
  :bind ("C-' m" . magit-status))

;;; Diff Highlight
(use-package diff-hl
  :ensure t
  :hook (prog-mode-hook . diff-hl-mode))

(provide 'init-git)
