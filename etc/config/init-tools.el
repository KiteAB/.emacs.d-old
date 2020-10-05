;;; This file is used for Tools Settings
;;; Emacs Application Framework
(use-package eaf
	:load-path "~/.emacs.d/site-lisp/emacs-application-framework"
	:bind (("C-q C-w l" . eaf-open-browser))
	:config
	(eaf-setq eaf-browser-remember-history "true")
	(eaf-setq eaf-browser-default-zoom "1.5")
	(defalias 'browse-web #'eaf-open-browser)
	(eaf-setq eaf-browser-dark-mode "true"))

;;; Company English Helper
(use-package company-english-helper
	:load-path "~/.emacs.d/site-lisp/company-english-helper"
	:config
	(load-file "~/.emacs.d/site-lisp/company-english-helper/company-english-helper-data.el")
	:bind (("C-' C-l s" . company-english-helper-search)))

;;; Awesome Shell
(use-package aweshell
	:load-path "~/.emacs.d/site-lisp/aweshell")

;;; VTerm
(use-package vterm
	:ensure t
	:bind (("C-' C-t" . open-vterm))
	:config
	(define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
	(define-key vterm-mode-map (kbd "C-c n") 'next-buffer))

;;; Counsel
(use-package counsel
	:ensure t
	:bind (("M-x" . counsel-M-x)
				 ("C-x C-f" . counsel-find-file)
				 ("C-q a" . counsel-linux-app)
				 ("C-x b" . counsel-switch-buffer)))

;;; Ivy
(use-package ivy
	:ensure t
	:hook (after-init-hook . ivy-mode))
;;; Child Packages
(use-package posframe
	:ensure t
	:config (setq posframe-mouse-banish nil))
(use-package ivy-posframe
	:ensure t
	:hook (ivy-mode-hook . ivy-posframe-mode)
	:config
	(setq ivy-posframe-display-functions-alist
				'((t . ivy-posframe-display-at-frame-center)))
	(setq ivy-posframe-parameters '((left-fringe . 8)
																	(add-hook 'ivy-mode-hook #'ivy-posframe-mode)))
	:bind (("C-s" . swiper)
				 ("C-r" . swiper-backward)
				 ("C-- s" . swiper-all)))

;;; Which Key
(use-package which-key
	:ensure t
	:hook (after-init-hook . which-key-mode))

;;; Ace Window
(use-package ace-window
	:ensure t
	:bind (("C-' C-c" . ace-window)))

;;; Iedit
(use-package iedit
	:ensure t
	:bind (("C-' C-e" . iedit-mode)))

;;; Hungry Delete
(use-package hungry-delete
	:ensure t
	:bind (("C-' C-h" . hungry-delete-mode)
			   ("C-' DEL" . hungry-delete-backward))
	:hook ((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))

;;; Magit
(use-package magit
	:ensure t
	:bind (("C-' m" . magit-status)))

;;; Window Resize
(use-package windresize
	:ensure t
	:bind (("C-' C-r" . windresize)))

;;; Multiple Cursor
(use-package multiple-cursors
	:ensure t
	:bind (("C-M-l" . mc/edit-lines)
				 ("C->" . mc/mark-next-like-this)
				 ("C-<" . mc/mark-previous-like-this)
				 ("M-m" . newline)))

;;; Youdao Translate
(use-package youdao-dictionary
	:ensure t
	:bind (("C-' t" . youdao-dictionary-search-at-point)))

;;; Treemacs - File Explore
(use-package treemacs
	:ensure t
	:bind (("C-' e" . treemacs)))
;;; Child Package
(use-package treemacs-all-the-icons :ensure t)

;;; Git Gutter
(use-package git-gutter
	:ensure t
	:disabled
	:config
	(global-git-gutter-mode +1)
	(custom-set-variables
	 '(git-gutter:update-interval 1)
	 '(git-gutter:added-sign "+")
   '(git-gutter:deleted-sign "_")
	 '(git-gutter:modified-sign "~")
	 '(git-gutter:hide-gutter t))
	(set-face-foreground 'git-gutter:added "#8CFF88")
	(set-face-foreground 'git-gutter:modified "#8CFF88")
	(set-face-foreground 'git-gutter:deleted "#FF2323"))

;;; Diff Highlight
(use-package diff-hl
	:ensure t
	:hook (prog-mode-hook . diff-hl-mode))

;;; Pacman in Emacs
(use-package arch-packer :ensure t)

;;; Figlet
(use-package figlet
	:ensure t
	:bind (("C-' F" . figlet)))

;;; Vc Message
(use-package vc-msg
	:ensure t
	:bind (("C-' s" . vc-msg-show)))

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
	:disabled
	:config
	(setq isearch-lazy-count t
				lazy-count-prefix-format "%s/%s "))

;;; New Comment
(use-package newcomment
	:ensure nil
	:bind (("C-' c d" . comment-dwin)
				 ("C-' c l" . comment-line)
				 ("C-' c b" . comment-box)))

;;; Winner Mode
(use-package winner-mode
	:ensure nil
	:hook (after-init-hook . winner-mode))

;;; Recentf
(use-package recentf
	:ensure nil
	:hook (after-init-hook . recentf-mode)
	:bind (("C-' r" . recentf-open-files)))

(provide 'init-tools)
