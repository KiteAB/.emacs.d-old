;;;; This file is used for packages configuration and more
;;; Set the plugin keybinding
(define-prefix-command 'plugin-key)
(define-prefix-command 'plugin-key-2)
(global-set-key (kbd "C-'") 'plugin-key)
(global-set-key (kbd "C--") 'plugin-key-2)

;;; Init Packages
(package-initialize)

;;; Mirror
(require 'package)
(require 'cl-lib) ; Common Lisp
(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
												 ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;;; Init Use-package
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(setq use-package-hook-name-suffix nil)

;;; Built-in Packages' Configuration
(require 'init-built-in-packages)

;;; Third Party Packages
;;; Emacs Application Framework
(use-package eaf
	:load-path "~/.emacs.d/site-lisp/emacs-application-framework"
	:bind (("C-q C-w l" . eaf-open-browser))
	:config
	(eaf-setq eaf-browser-remember-history "true")
	(eaf-setq eaf-browser-default-zoom "1.5")
	(defalias 'browse-web #'eaf-open-browser)
	(eaf-setq eaf-browser-dark-mode "true")
;	:hook (eaf-mode-hook . (lambda () (evil-emacs-state)))
	)

;;; Company English Helper
(use-package company-english-helper
	:load-path "~/.emacs.d/site-lisp/company-english-helper"
	:config
	(load-file "~/.emacs.d/site-lisp/company-english-helper/company-english-helper-data.el")
	:bind (("C-' C-l s" . company-english-helper-search)))

;;; Awesome Tray
(use-package awesome-tray
	:load-path "~/.emacs.d/site-lisp/awesome-tray"
	:hook (after-init-hook . awesome-tray-mode)
	:config
	(setq awesome-tray-active-modules '("circe" "git" "parent-dir" "location" "mode-name" "buffer-name" "date")))

;;; Insert Translated Name
(use-package insert-translated-name
	:load-path "~/.emacs.d/site-lisp/insert-translated-name"
	:bind (("C-' C-l i" . insert-translated-name-insert)
				 ("C-' C-l u" . insert-translated-name-insert-with-underline)
				 ("C-' C-l c" . insert-translated-name-insert-with-camel)
				 ("C-' C-l l" . insert-translated-name-insert-with-line)
				 ("C-' C-l o" . insert-translated-name-insert-original-translation)
				 ("C-' C-l r" . insert-translated-name-replace)
				 ("C-' C-l U" . insert-translated-name-replace-with-underline)
				 ("C-' C-l C" . insert-translated-name-replace-with-camel)
				 ("C-' C-l L" . insert-translated-name-replace-with-line)))

;;; Lazycat Themes
(use-package lazycat-theme
	:load-path "~/.emacs.d/site-lisp/lazycat-theme")

;;; Spacemacs Theme
(use-package spacemacs-common
	:ensure spacemacs-theme
	:defer
;	:config
;	(setq-default cursor-type '(bar . 1))
;	(set-cursor-color "white")
	)

;;; Circadian - Switch Theme
(use-package circadian
	:ensure t
	:config
	(setq calendar-latitude 27.831940
				calendar-longitude 113.148087)
	(setq circadian-themes '((:sunrise . lazycat-light)
													 (:sunset . lazycat-dark)))
	(circadian-setup)
	(setq-default cursor-type '(bar . 1)))

;;; Dashboard
(use-package dashboard
	:ensure t
	:disabled
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "KiteAB's Emacs - Vim Defector No.114514"
				dashboard-startup-banner 'logo
				dashboard-center-content t
				dashboard-set-heading-icons t
				dashboard-set-file-icons t
				dashboard-set-navigator t))

;;; Org Mode
(use-package org
	:ensure t
	:init
	(define-prefix-command 'org-key-map)
	(global-set-key (kbd "C-q C-c") 'org-key-map)
	:bind (("C-q C-c g" . org-agenda)
				 ("C-q C-c c" . org-capture)
				 ("C-q C-c s" . org-timer-start)
				 ("C-q C-c S" . org-timer-set-timer)
				 ("C-q C-c e" . org-timer-stop)
				 ("C-q C-c SPC" . org-timer-pause-or-continue)
				 ("C-q C-c C-i" . kiteab/use-space-indent))
	:config
	(setq org-src-fontify-natively t)
	(require 'init-org)
	:hook (org-mode-hook . (lambda () (setq indent-tabs-mode nil) (define-key org-mode-map (kbd "C-'") nil))))
;;; Child Package
(use-package org-bullets
  :ensure t
	:hook (org-mode-hook . (lambda () (org-bullets-mode t)))
	:custom (org-bullets-bullet-list '("☰" "☷" "✿" "☭")))

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
	:config
	(setq ivy-posframe-display-functions-alist
				'((t . ivy-posframe-display-at-frame-center)))
	(setq ivy-posframe-parameters '((left-fringe . 8)
																	(add-hook 'ivy-mode-hook #'ivy-posframe-mode)))
	:bind (("C-s" . swiper)
				 ("C-r" . swiper-backward)
				 ("C-- s" . swiper-all)))

;;; Bongo
(use-package bongo :ensure t)

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

;;; JS2 Mode
(use-package js2-mode
	:ensure t
	:hook (js-mode . js2-mode))

;;; Web Mode
(use-package web-mode
	:ensure t
	:config
	(setq auto-mode-alist
				(append '(("\\.html\\'" . web-mode)) auto-mode-alist))
	(setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
								web-mode-css-indent-offset 2
								web-mode-code-indent-offset 2)) ; Indent of JavaScript in HTML


;;; Auto Completion
;;; Company (Complete Anything)
(use-package company
	:ensure t
	:hook (after-init-hook . global-company-mode)
	:config
	(setq company-idle-delay 0
				company-minimum-prefix-length 1)
	(with-eval-after-load 'company
		(define-key company-active-map (kbd "M-p") nil)
		(define-key company-active-map (kbd "M-n") nil)
		(define-key company-active-map (kbd "C-n") #'company-select-next)
		(define-key company-active-map (kbd "C-p") #'company-select-previous))
	(push 'company-capf company-backends)
	:bind (("C-' C-y" . yas-expand-from-trigger-key)))
;;; Child Packages
(use-package company-c-headers
	:ensure t
	:config (add-to-list 'company-backends 'company-c-headers))
(use-package company-box
	:ensure t
	:hook (company-mode-hook . company-box-mode))

;;; Lsp Mode
(use-package lsp-mode
	:hook ((c-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
	:bind (("C-' F" . lsp-format-buffer))
	:config
	(setq lsp-idle-delay 1200
				lsp-auto-guess-root nil
				lsp-file-watch-threshold 2000
				lsp-eldoc-hook nil
				lsp-log-io nil
				lsp-enable-folding nil
				lsp-enable-snippet nil
				lsp-prefer-flymake :none))

;;; Evil Mode
;(require 'init-evil)

;;; Emmet Mode
(use-package emmet-mode
	:ensure t
	:hook (web-mode-hook . emmet-mode)
	:config (setq emmet-self-closing-tag-style " /"))

;;; Snippets
(use-package yasnippet
	:ensure t
	:bind (("C-' C-y" . yas-expand-from-trigger-key))
	:hook (after-init-hook . yas-global-mode)
	:config
	(use-package yasnippet-snippets :ensure t)
	(setq yas-snippet-dirs '("~/.emacs.d/snippets"
													 "~/.emacs.d/var/elpa/yasnippet-snippets-20200909.1058/snippets")))

;;; FlyMake
(use-package flymake
	:ensure t
	:bind (("C-' C-f" . flymake-mode)))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
	:ensure t
	:hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode)
	:config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "lime green")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "cyan")
  (set-face-bold 'rainbow-delimiters-depth-1-face "t")
  (set-face-bold 'rainbow-delimiters-depth-2-face "t")
  (set-face-bold 'rainbow-delimiters-depth-3-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-4-face "t")
  (set-face-bold 'rainbow-delimiters-depth-5-face "t")
  (set-face-bold 'rainbow-delimiters-depth-6-face "t")
  (set-face-bold 'rainbow-delimiters-depth-7-face "t")
  (set-face-bold 'rainbow-delimiters-depth-8-face "t")
  (set-face-bold 'rainbow-delimiters-depth-9-face "t"))

;;; Indent Guide
(use-package indent-guide
	:ensure t
	:hook (after-init-hook . indent-guide-global-mode))

;;; Doom Modeline
(use-package doom-modeline
	:ensure t
	:disabled
	:hook (after-init-hook . doom-modeline-mode)
	:config
	(setq-default doom-modeline-height 13)
	(setq-default doom-modeline-bar-width 3))

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

;;; Perspective - "Virtual Desktop" in Emacs
(use-package perspective
	:ensure t
	:hook (after-init-hook . persp-mode))

;;; Info Colors
(use-package info-colors
  :ensure t
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;;; NyanCat Mode
(use-package nyan-mode
  :ensure t
	:disabled
  :hook (after-init-hook . nyan-mode)
	:config (setq nyan-wavy-trail t
								nyan-animate-nyancat t))

;;; Page Break Lines
(use-package page-break-lines
  :ensure t
  :hook (prog-mode-hook . page-break-lines-mode))

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

(provide 'init-packages)
