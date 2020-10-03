;;;; This file is used for built-in packages' configuration
;;; Dired - File Operations
(use-package dired
	:ensure nil
	:config
	(define-advice dired-do-print (:override (&optional _))
    "Show/hide dotfiles."
    (interactive)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p)
        (progn
          (setq-local dired-dotfiles-show-p nil)
          (dired-mark-files-regexp "^\\.")
          (dired-do-kill-lines))
      (revert-buffer)
      (setq-local dired-dotfiles-show-p t))))
;;; Child Package
(use-package all-the-icons-dired :ensure t)

;;; Auto Revert
(use-package autorevert
  :ensure nil
  :hook (after-init-hook . global-auto-revert-mode))

;;; Command Log
(use-package command-log-mode
	:ensure nil
	:config
	(defun kiteab/open-or-close-command-log-mode ()
		"Open the command-log-mode."
		(interactive)
		(global-command-log-mode)
		(clm/toggle-command-log-buffer))
	:bind (("C-' k" . kiteab/open-or-close-command-log-mode)
				 ("C-' K" . clm/command-log-clear)))

;;; Align
(use-package align
	:ensure nil
	:bind (("C-' A" . align-regexp)))

;;; I-search
(use-package isearch
	:ensure nil
	:config
	(setq isearch-lazy-count t
				lazy-count-prefix-format "%s/%s "))

(provide 'init-built-in-packages)
