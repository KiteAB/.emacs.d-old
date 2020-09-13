;;;; This file is used for packages configuration and more
;;; Set the plugin keybinding
(define-prefix-command 'plugin-key)
(global-set-key (kbd "C-'") 'plugin-key)

;;; Third Party Packages
;;; Emacs Application Framework
(use-package eaf
 :load-path "~/.emacs.d/third-party/emacs-application-framework"
 :bind (("C-z C-w l" . eaf-open-browser)
			  ("C-z C-w h" . eaf-open-browser-with-history)
			  ("C-z C-m b" . eaf-open-bookmark))
 :config (progn
					 (eaf-setq eaf-browser-remember-history "true")
					 (eaf-setq eaf-browser-default-zoom "1.2")
  				 ; Set the default browser
					 (setq browse-url-browser-function 'eaf-open-browser)
					 (defalias 'browse-web #'eaf-open-browser)
					 (defun eaf-browser-set ()
						 (interactive)
						 (eaf-setq eaf-browser-dark-mode "true"))
					 (eaf-browser-set)))

;;; English Teacher
(use-package english-teacher
 :load-path "~/.emacs.d/third-party/english-teacher.el"
 :bind (("C-' C-l" . english-teacher-smart-translation))
 :config (setq english-teacher-backend 'baidu
							 english-teacher-show-result-function 'english-teacher-eldoc-show-result-function)
 :hook ((Info-mode-hook eww-mode-hook help-mode-hook) . english-teacher-follow-mode))

;;; Request
(use-package request
 :ensure t)

;;; Atom One Dark Theme
(use-package atom-one-dark-theme
	:ensure t
	:config (load-theme 'atom-one-dark t)
	(setq-default cursor-type '(bar . 1))
	(set-cursor-color "white"))

;;; Dashboard
(use-package dashboard
	:ensure t
	:config (progn
						 (dashboard-setup-startup-hook)
						 (setq dashboard-banner-logo-title "KiteAB's Emacs - Vim Defector No.114514")
						 (setq dashboard-startup-banner 'logo)
						 (setq dashboard-center-content t
									 dashboard-set-heading-icons t
									 dashboard-set-file-icons t
									 dashboard-set-navigator t)))

;;; Org Mode
(use-package org
 :ensure t
 :init (progn
				 (define-prefix-command 'org-key-map)
				 (global-set-key (kbd "C-z C-c") 'org-key-map))
 :bind (("C-z C-c g" . org-agenda)
				("C-z C-c c" . org-capture)
				("C-z C-c s" . org-timer-start)
				("C-z C-c S" . org-timer-set-timer)
				("C-z C-c e" . org-timer-stop)
				("C-z C-c SPC" . org-timer-pause-or-continue)
				("C-z C-c C-i" . kiteab/use-space-indent))
 :config (progn
					 (setq org-src-fontify-natively t)
					 (require 'init-org))
 :hook (org-mode-hook . (lambda () (setq indent-tabs-mode nil) (define-key org-mode-map (kbd "C-'") nil))))
;;; Child Package
(use-package org-bullets
 :ensure t
 :hook (org-mode-hook . (lambda () (org-bullets-mode t)))
 :config (setq org-bullets-bullet-list '("" "☯" "❀" "✿")))

;;; VTerm
(use-package vterm
 :ensure t
 :bind (("C-' C-t" . open-vterm))
 :config (progn
					 (define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
					 (define-key vterm-mode-map (kbd "C-c n") 'next-buffer)))

;;; Counsel
(use-package counsel
 :ensure t
 :bind (("M-x" . counsel-M-x)
				("C-x C-f" . counsel-find-file)
				("C-z a" . counsel-linux-app)))

;;; Icons
(use-package all-the-icons
 :ensure t
 :bind (("C-' C-i" . all-the-icons-insert)))

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
 :config (progn
					 (setq ivy-posframe-display-functions-alist
								 '((t . ivy-posframe-display-at-frame-center)))
					 (setq ivy-posframe-parameters '((left-fringe . 8)
																					 (add-hook 'ivy-mode-hook #'ivy-posframe-mode)))))

;;; Bongo
(use-package bongo
	:ensure t)

;;; Which Key
(use-package which-key
	:ensure t
	:hook (after-init-hook . which-key-mode))

;;; Ace Window
(use-package ace-window
	:ensure t
 :bind (("C-' C-c" . ace-window)))

;;; Calendar China
(use-package cal-china-x
	:ensure t)

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

;;; js2 Mode
(use-package js2-mode
 :ensure t
 :hook (js-mode . js2-mode))

;;; Web Mode
(use-package web-mode
	:ensure t
	:config (progn
						(setq auto-mode-alist
									(append '(("\\.html\\'" . web-mode)) auto-mode-alist))
						(setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
													web-mode-css-indent-offset 2
													web-mode-code-indent-offset 2))) ; Indent of JavaScript in HTML


;;; Auto Completion
;;; Company (Complete Anything)
(use-package company
 :ensure t
 :hook (after-init-hook . global-company-mode)
 :config (progn
					 (setq company-idle-delay 0
								 company-minimum-prefix-length 1)
					 (with-eval-after-load
							 'company
						 (define-key company-active-map (kbd "M-p") nil)
						 (define-key company-active-map (kbd "M-n") nil)
						 (define-key company-active-map (kbd "C-n") #'company-select-next)
						 (define-key company-active-map (kbd "C-p") #'company-select-previous))))
;;; Child Packages
(use-package company-c-headers
	:ensure t
	:config (add-to-list 'company-backends 'company-c-headers))

;;; Lsp Mode
(use-package lsp-mode
 :hook ((c-mode-hook python-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
 :bind (("C-' F" . lsp-format-buffer))
 :config (progn
					 (setq lsp-idle-delay 1200
								 lsp-auto-guess-root nil
								 lsp-file-watch-threshold 2000
								 lsp-eldoc-hook nil
								 lsp-prefer-flymake nil)))

;; ccls (For Lsp Mode)
;; (use-package ccls
;;  :ensure t
;;  :hook ((c-mode-hook c++-mode-hook objc-mode-hook) . (lambda () (lsp))))

;;; Emmet Mode
(use-package emmet-mode
 :ensure t
 :hook (web-mode-hook . emmet-mode)
 :config (progn (setq emmet-self-closing-tag-style " /")))

;;; Snippets
(use-package yasnippet
 :ensure t
 :bind (("C-' i" . yas-insert-snippet)
			  ("C-' C-y" . yas-expand-from-trigger-key))
 :hook (after-init-hook . yas-global-mode)
 :config (progn
					 (use-package yasnippet-snippets
						 :ensure t)
					 (setq yas-snippet-dirs '("~/.emacs.d/snippets"
																		"~/.emacs.d/elpa/yasnippet-snippets-20200802.1658/snippets"))))

;;;FlyMake
(use-package flymake
 :ensure t
 :bind (("C-' C-f" . flymake-mode)))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
 :ensure t
 :hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode))

;;; Indent Guide
(use-package indent-guide
 :ensure t
 :hook (after-init-hook . indent-guide-global-mode))

;;; Doom Modeline
(use-package doom-modeline
 :ensure t
 :hook (after-init-hook . doom-modeline-mode)
 :config (progn
					 (setq-default doom-modeline-height 13)
					 (setq-default doom-modeline-bar-width 3)))

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

;;; Dap Mode
(use-package dap-mode
 :ensure t
 :bind (("C-' d" . dap-debug)
			  ("<F5>" . dap-breakpoint-toggle)
				("<F6>" . dap-continue)))

;;; Avy Mode
(use-package avy
 :ensure t
 :bind (("C-' a c" . avy-goto-char)
			  ("C-' a C" . avy-goto-char-2)
				("C-' a l" . avy-goto-line)
				("C-' a w" . avy-goto-word-1)
				("C-' a W" . avy-goto-word-0)
				("C-' a r" . avy-resume)))

;;; CapsLock
(use-package caps-lock
 :ensure t
 :bind (("C-' g" . caps-lock-mode)))

;;; Isolate Mode
(use-package isolate
 :ensure t
 :bind (("C-' C-a s" . isolate-quick-add)
				("C-' C-a S" . isolate-long-add)
				("C-' C-a d" . isolate-quick-delete)
				("C-' C-a D" . isolate-long-delete)
				("C-' C-a c" . isolate-quick-change)
				("C-' C-a C" . isolate-long-change)))

;;; Paredit Mode
(use-package paredit
 :ensure t
 :hook ((lisp-mode-hook emacs-lisp-mode-hook eshell-mode-hook lisp-interaction-mode-hook) . paredit-mode)
 :bind (("C-' f" . paredit-focus-on-defun)))

;;; QuickRun
(use-package quickrun
 :ensure t
 :bind (("C-' r" . quickrun-shell)))

;;; Grugru - Rotate text at point
(use-package grugru
	:ensure t
	:init (grugru-default-setup)
	:bind (("C-' C-g" . grugru)))

;;; Telega
(use-package telega
	:ensure t)

;;; Perspective - "Virtual Desktop" in Emacs
(use-package perspective
	:ensure t
	:config
	(persp-mode))

;;; GitHub Explorer
(use-package github-explorer
	:ensure t
	:bind (("C-' G" . github-explorer)))

;;; Info Colors
(use-package info-colors
  :ensure t
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;;; NyanCat Mode
(use-package nyan-mode
  :ensure t
  :hook (after-init-hook . nyan-mode)
	:config
	(nyan-start-animation)
	(nyan-toggle-wavy-trail))

;;; Page Break Lines
(use-package page-break-lines
  :ensure t
  :hook (after-init-hook . page-break-lines-mode)
  :config (turn-on-page-break-lines-mode))

;;; Git-Gutter
(use-package git-gutter
	:ensure t
	:config
	(global-git-gutter-mode +1)
	(custom-set-variables
	 '(git-gutter:update-interval 0)
	 '(git-gutter:added-sign "+")
   '(git-gutter:deleted-sign "_")
	 '(git-gutter:modified-sign "~")))

;;; Beacon
(use-package beacon
	:ensure t
	:hook (after-init-hook . beacon-mode))

(provide 'init-packages)