;;;; This file is used for set the basic things
;;; Functions
(fset 'yes-or-no-p 'y-or-n-p) ; Change the asking's answer way
(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?_ "w")))
(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?- "w")))
(delete-selection-mode t) ; Delete the seleceted text
(show-paren-mode t) ; Highlight the "()"
(electric-pair-mode t) ; Auto complete the "()"

;; UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)    ; pretty
(set-terminal-coding-system  'utf-8)    ; pretty
(set-keyboard-coding-system  'utf-8)    ; pretty
(set-selection-coding-system 'utf-8)    ; please
(prefer-coding-system        'utf-8)    ; with sugar on top
(setq default-process-coding-system '(utf-8 . utf-8))

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
(setq-default indent-tabs-mode nil) ; Use space indent
(setq-default css-indent-offset 2) ; Set css indent width
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
;; (column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
(setq user-emacs-directory "~/.emacs.d/var") ;;; The Cache Directory
(setq user-init-file "~/.emacs.d/var/user-init.el")
(setq load-prefer-newer t)
(save-place-mode t) ; Save the point position
(setq ring-bell-function 'ignore) ; Disable Infos
(setq inhibit-compacting-font-caches nil) ; Disable font cache
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always) ; Scroll
(setq mouse-yank-at-point nil)

(provide 'init-basic)
