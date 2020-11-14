;;; init-git.el --- Settings for Git
;;; Code:
;;; Vc Message
(leaf vc-msg
  :ensure t
  :bind
  ("C-' s" . vc-msg-show))

;;; Magit
(leaf magit
  :ensure t
  :bind
  ("C-' m" . magit-status)
  (:magit-mode-map
   ("q" . kiteab/kill-magit)))

;;; Diff Highlight
(leaf diff-hl
  :ensure t
  :hook prog-mode-hook
  :config
  (diff-hl-mode))

(provide 'init-git)

;;; init-git.el ends here
