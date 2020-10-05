;;;; This file is used for set the basic things
;;; Functions
(fset 'yes-or-no-p 'y-or-n-p) ; Change the asking's answer way
(delete-selection-mode t) ; Delete the seleceted text
(show-paren-mode t) ; Highlight the ()
(electric-pair-mode t) ; Auto complete the ()
(setq electric-pair-pairs
			'((?\" . ?\")
  			(?\( . ?\))
				(?\< . ?\>)
				(?\{ . ?\}))) ; Set the electric-pair-mode's pair keywords
(setq make-backup-files nil ; Don't let Emacs make up backup file
      create-lockfiles nil ;Don't make lockfile
      auto-save-default nil ; Don't auto save the file
      )
(setq initial-scratch-message
			";; KiteAB's Emacs
;; This is the scratch buffer for startup page and test Emacs Lisp code

")
(setq-default tab-width 2) ; The tab width
(setq-default indent-tabs-mode t) ; Use tab indent
(setq-default css-indent-offset 2) ; Set css indent width
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
(column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
(setq user-emacs-directory "~/.emacs.d/var") ;;; The Cache Directory
(setq user-init-file "~/.emacs.d/var/user-init.el")
(save-place-mode t) ; Save the point position
(setq ring-bell-function 'ignore blink-cursor-mode nil) ; Disable Infos
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always) ; Scroll
(setq mouse-yank-at-point nil)

(add-hook 'markdown-mode-hook #'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook #'(lambda () (display-line-numbers-mode -1))) ; Disable line numbers in ERC
(add-hook 'magit-mode-hook #'(lambda () (define-key magit-mode-map "q" 'kiteab/kill-magit))) ; Clear buffer about Magit
(add-hook 'emacs-lisp-mode-hook #'(lambda () (outline-minor-mode t)))
(add-hook 'web-mode-hook #'(lambda () (outline-minor-mode t)))

(provide 'init-basic)
