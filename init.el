;;  __  __         _____
;; |  \/  |_   _  | ____|_ __ ___   __ _  ___ ___
;; | |\/| | | | | |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |  | | |_| | | |___| | | | | | (_| | (__\__ \
;; |_|  |_|\__, | |_____|_| |_| |_|\__,_|\___|___/
;;         |___/

;; Author: KiteAB (https://github.com/KiteAB)
;; Repository: https://github.com/KiteAB/.emacs.d

;;; Benchmark
;(load-file "~/.emacs.d/benchmark.el")

;;; Auto opzimization
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq inhibit-compacting-font-caches nil)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda ()
														 (setq gc-cons-threshold gc-cons-threshold-original)
                             (setq file-name-handler-alist file-name-handler-alist-original)
                             (makunbound 'gc-cons-threshold-original)
                             (makunbound 'file-name-handler-alist-original)
                             (message "Auto opzimization done.")))

;;;; Config Files
(add-to-list 'load-path "~/.emacs.d/etc/settings")
(add-to-list 'load-path "~/.emacs.d/etc/languages")
(add-to-list 'load-path "~/.emacs.d/etc/tools")
;;; Macros
(require 'init-macros)
;;; GitHub
(load-file "~/.emacs.d/token.el")
(require 'github-token)
;;; The cache directory
(setq user-emacs-directory "~/.emacs.d/var")
;;; Fuzzy Files Finder
(setq counsel-fzf-cmd "fd --type f | fzf -f \"%s\" --algo=v1")
;;; Other Settings
;;; User Interface
(require 'init-ui)
;;; Functions
(require 'init-functions)
;;; Keymaps
(require 'init-keymaps)
;;; Other mode settings
(require 'init-modes)


;;; Basic Settings
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
;; Elisp interactive arguments
;; a -- Function name: symbol with a function definition.
;; b -- Name of existing buffer.
;; B -- Name of buffer, possibly nonexistent.
;; c -- Character (no input method is used).
;; C -- Command name: symbol with interactive function definition.
;; d -- Value of point as number.  Does not do I/O.
;; D -- Directory name.
;; e -- Parameterized event (i.e., one that’s a list) that invoked this command.
;;      If used more than once, the Nth ‘e’ returns the Nth parameterized event.
;;      This skips events that are integers or symbols.
;; f -- Existing file name.
;; F -- Possibly nonexistent file name.
;; G -- Possibly nonexistent file name, defaulting to just directory name.
;; i -- Ignored, i.e. always nil.  Does not do I/O.
;; k -- Key sequence (downcase the last event if needed to get a definition).
;; K -- Key sequence to be redefined (do not downcase the last event).
;; m -- Value of mark as number.  Does not do I/O.
;; M -- Any string.  Inherits the current input method.
;; n -- Number read using minibuffer.
;; N -- Numeric prefix arg, or if none, do like code ‘n’.
;; p -- Prefix arg converted to number.  Does not do I/O.
;; P -- Prefix arg in raw form.  Does not do I/O.
;; r -- Region: point and mark as 2 numeric args, smallest first.  Does no I/O.
;; s -- Any string.  Does not inherit the current input method.
;; S -- Any symbol.
;; U -- Mouse up event discarded by a previous k or K argument.
;; v -- Variable name: symbol that is ‘custom-variable-p’.
;; x -- Lisp expression read but not evaluated.
;; X -- Lisp expression read and evaluated.
;; z -- Coding system.
;; Z -- Coding system, nil if no prefix arg.

")
(setq-default tab-width 2) ; The tab width
(setq-default indent-tabs-mode t) ; Use tab indent
(setq css-indent-offset 2) ; Set css indent width
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
(column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
(setq user-init-file "~/.emacs.d/var/user-init.el")
(save-place-mode t) ; Save the point position
(add-hook 'markdown-mode-hook #'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook #'(lambda () (display-line-numbers-mode -1)))
(add-hook 'magit-mode-hook #'(lambda () (define-key magit-mode-map "q" 'kiteab/kill-magit)))
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

;;; Plugin requires
(require 'init-packages)
(package-initialize)

;;; Enable Disbaled command
(require 'novice)
(require 'init-enable-disabled-commands)
(enable-commands-init)

;;; Languages settings
(require 'kiteab-python)
(require 'kiteab-c)
