;;; This file is used for Generic Settings
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

(setq initial-scratch-message (format ";; KiteAB Emacs
;; Emacs Startup Time: %.2fs, With %s Garbage Collects
;; %s Packages Loaded, %s Features Required

" (float-time (time-subtract after-init-time before-init-time))
gcs-done
(length package-activated-list)
(length features)))

(setq-default tab-width 2) ; The tab width
(setq-default indent-tabs-mode nil) ; Use space indent
(setq-default css-indent-offset 2) ; Set css indent width
(setq eshell-history-file-name "~/.emacs/var/eshell/history")
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
;; (column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
(setq user-emacs-directory "~/.emacs.d/var") ;;; The Cache Directory
(setq user-init-file "~/.emacs.d/var/user-init.el")
(setq load-prefer-newer t)
(save-place-mode t) ; Save the point position
(setq ring-bell-function 'ignore
      blink-cursor-mode nil) ; Disable Infos
(setq inhibit-compacting-font-caches t) ; Enable font cache
(setq bookmark-default-file "~/.emacs.d/site-lisp/config/init-bookmarks.el") ; Bookmarks File
(global-auto-revert-mode t)
(setq load-prefer-newer t)
;; (setq scroll-step 2
;;       scroll-margin 2
;;       hscroll-step 2
;;       hscroll-margin 2
;;       scroll-conservatively 101
;;       scroll-up-aggressively 0.01
;;       scroll-down-aggressively 0.01
;;       scroll-preserve-screen-position 'always)
                                        ; Scroll
(setq mouse-yank-at-point nil)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(provide 'init-generic)
