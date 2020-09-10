;;;; This file is used for packages configuration and more
;;; Set the plugin keybinding
(define-prefix-command 'plugin-key)
(global-set-key (kbd "C-'") 'plugin-key)

;;;; Themes
(load-the-theme)

;;; Third-party
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
						 (if (day-or-night)
								 (eaf-setq eaf-browser-dark-mode "false")
							 (eaf-setq eaf-browser-dark-mode "true")))
					 (eaf-browser-set)))

;;; English Teacher
(use-package english-teacher
 :load-path "~/.emacs.d/third-party/english-teacher.el"
 :bind (("C-' C-l" . english-teacher-smart-translation))
 :config (setq english-teacher-backend 'baidu
							 english-teacher-show-result-function 'english-teacher-eldoc-show-result-function)
 :hook ((Info-mode-hook eww-mode-hook help-mode-hook) . english-teacher-follow-mode))

;;; Netease Cloud Music
(use-package netease-cloud-music
 :load-path "~/.emacs.d/third-party/netease-cloud-music.el"
 :bind (("C-' C-m t" . netease-cloud-music)
				("C-' C-m r" . netease-cloud-music-change-repeat-mode)))
;;; Child package
(use-package request
 :ensure t)


;;; Dashboard
(use-package dashboard
	:ensure t
	:config (progn
						 (dashboard-setup-startup-hook)
						 (setq dashboard-banner-logo-title "Vim Defector No.114514")
						 (setq dashboard-startup-banner 'logo)
						 (setq dashboard-center-content t
									 dashboard-set-heading-icons t
									 dashboard-set-navigator t
									 dashboard-init-info "KiteAB's Emacs")))

;;; Org
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
;;; Child package
(use-package org-bullets
 :ensure t
 :hook (org-mode-hook . (lambda () (org-bullets-mode t)))
 :config (setq org-bullets-bullet-list '("" "☯" "❀" "✿")))

;;; Vterm
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

;;; ivy
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
																					 (right-fringe . 8)))))

;;; Bongo
(use-package bongo
	:ensure t)

;;; Which Key
(use-package which-key
	:ensure t
	:hook (after-init-hook . which-key-mode))

;;; ace window
(use-package ace-window
	:ensure t
 :bind (("C-' C-c" . ace-window)))

;;; Calendar-China
(use-package cal-china-x
	:ensure t)

;;; Iedit
(use-package iedit
 :ensure t
 :bind (("C-' C-e" . iedit-mode)))

;;; hungry-delete
(use-package hungry-delete
 :ensure t
 :bind (("C-' C-h" . hungry-delete-mode)
			  ("C-' DEL" . hungry-delete-backward))
 :hook ((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))

;;; js2-mode
(use-package js2-mode
 :ensure t
 :hook (js-mode . js2-mode))

;;; Web-mode
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
						 (define-key company-active-map (kbd "C-p") #'company-select-previous))
					 (use-package company-lsp
						 :ensure t)
					 (use-package company-c-headers
						 :ensure t
						 :config (add-to-list 'company-backends 'company-c-headers))))

;;; Lsp-mode
(use-package lsp-mode
 :hook ((c-mode-hook python-mode c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
 :bind (("C-' F" . lsp-format-buffer))
 :config (progn
					 (setq lsp-idle-delay 1200
								 lsp-auto-guess-root nil
								 lsp-file-watch-threshold 2000
								 lsp-eldoc-hook nil
								 lsp-prefer-flymake nil)))

;; ccls (For lsp-mode)
;; (use-package ccls
;;  :ensure t
;;  :hook ((c-mode-hook c++-mode-hook objc-mode-hook) . (lambda () (lsp))))

;;; emmet-mode
(use-package emmet-mode
 :ensure t
 :hook (web-mode-hook . emmet-mode)
 :config (progn (setq emmet-self-closing-tag-style " /")))

;;; Snippet
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

;;; rainbow-delimiters
(use-package rainbow-delimiters
 :ensure t
 :hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode))

;;; indent guide
(use-package indent-guide
 :ensure t
 :hook (after-init-hook . indent-guide-global-mode))

;;; doom-modeline
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

;;; Multiple cursor
(use-package multiple-cursors
 :ensure t
 :bind (("C-M-l" . mc/edit-lines)
				("C->" . mc/mark-next-like-this)
				("C-<" . mc/mark-previous-like-this)
				("M-m" . newline)))

;;; Youdao translate
(use-package youdao-dictionary
 :ensure t
 :bind (("C-' t" . youdao-dictionary-search-at-point)))

;;; Treemacs - File explore
(use-package treemacs
 :ensure t
 :bind (("C-' e" . treemacs)))

;;; Dap-mode
(use-package dap-mode
 :ensure t
 :bind (("C-' d" . dap-debug)
			  ("<F5>" . dap-breakpoint-toggle)
				("<F6>" . dap-continue)))

;;; avy-mode
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

;;; isolate-mode
(use-package isolate
 :ensure t
 :bind (("C-' C-a s" . isolate-quick-add)
				("C-' C-a S" . isolate-long-add)
				("C-' C-a d" . isolate-quick-delete)
				("C-' C-a D" . isolate-long-delete)
				("C-' C-a c" . isolate-quick-change)
				("C-' C-a C" . isolate-long-change)))

;;; paredit-mode
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

(provide 'init-package)
