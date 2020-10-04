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
(setq-default css-indent-offset 2) ; Set css indent width
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
(column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
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
(setq counsel-fzf-cmd "fd --type f | fzf -f \"%s\" --algo=v1") ; Fuzzy File Finder

(add-hook 'markdown-mode-hook #'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook #'(lambda () (display-line-numbers-mode -1))) ; Disable line numbers in ERC
(add-hook 'magit-mode-hook #'(lambda () (define-key magit-mode-map "q" 'kiteab/kill-magit))) ; Clear buffer about Magit
(add-hook 'emacs-lisp-mode-hook #'(lambda () (outline-minor-mode t)))
(add-hook 'web-mode-hook #'(lambda () (outline-minor-mode t)))

(provide 'init-basic)
(provide 'kiteab-c)
