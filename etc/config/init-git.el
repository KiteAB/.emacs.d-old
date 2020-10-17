;;; This file is used for Git Tools
;;; Vc Message
(use-package vc-msg
  :ensure t
  :defer 1
  :bind (("C-' s" . vc-msg-show)))

;;; Magit
(use-package magit
  :ensure t
  :bind (("C-' m" . magit-status)))

;;; Diff Highlight
(use-package diff-hl
  :ensure t
  :defer 1
  :hook (prog-mode-hook . diff-hl-mode))

(provide 'init-git)
