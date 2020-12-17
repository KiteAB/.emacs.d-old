;;; init-git.el --- Settings for git
;;; Code:
;;; Vc Message
(use-package vc-msg
  :ensure t
  :bind ("C-' s" . vc-msg-show))

;;; Magit
(use-package magit
  :ensure t
  :config
  (defun kiteab/kill-magit (&optional dir)
    "Kill the buffer about Magit"
    (interactive)
    (magit-mode-bury-buffer)
    (unless (null (magit-mode-get-buffers))
      (dolist (buffer (magit-mode-get-buffers))
        (kill-buffer buffer)))
    (xah-fly-keys 1))
  :bind (("C-' m" . magit-status)
         :map magit-mode-map
         ("q" . kiteab/kill-magit)))

;;; Diff Highlight
(use-package diff-hl
  :ensure t
  :hook (prog-mode-hook . diff-hl-mode))

(provide 'init-git)

;;; init-git.el ends here
