;;; This file is used for Evil Configuration
(use-package evil-leader
	:ensure t
	:hook (after-init-hook . global-evil-leader-mode))
(use-package evil
	:ensure t
	:hook (global-evil-leader-mode-hook . (lambda () (evil-mode t))))
;;; Child Package
(use-package undo-tree :ensure t)

;;; The functions to set the evil-keys
(defun set-in-evil-states (key def maps)
	(while maps
		(define-key (pop maps) key def)))

(defun set-in-navigation-evil-states (key def)
	(set-in-evil-states key def (list evil-motion-state-map
																		evil-normal-state-map
																		evil-visual-state-map)))

;;; Defines

;;; Cursors' movement
(set-in-navigation-evil-states "u" 'evil-previous-line)
(set-in-navigation-evil-states "e" 'evil-next-line)
(set-in-navigation-evil-states "n" 'evil-backward-char)
(set-in-navigation-evil-states "i" 'evil-forward-char)

(set-in-navigation-evil-states "I" '(lambda () (interactive) (evil-end-of-line)))
(set-in-navigation-evil-states "N" '(lambda () (interactive) (evil-beginning-of-line)))
(set-in-navigation-evil-states "E" '(lambda () (interactive) (evil-next-line 5)))
(set-in-navigation-evil-states "U" '(lambda () (interactive) (evil-previous-line 5)))

;;; Other movement
(define-key evil-normal-state-map "S" 'save-buffer)
(define-key evil-normal-state-map "Q" 'kill-current-buffer)
(define-key evil-normal-state-map "l" 'undo)
(define-key evil-motion-state-map ";" 'counsel-M-x)
(define-key evil-normal-state-map "k" 'evil-insert)

(set-in-navigation-evil-states "/" 'swiper)
(set-in-navigation-evil-states "=" 'evil-search-next)
(set-in-navigation-evil-states "-" 'evil-search-previous)
(define-key evil-insert-state-map (kbd "M-p") 'previous-line)
(define-key evil-insert-state-map (kbd "M-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'evil-normal-state)

;;; Leader
(setq evil-leader/leader ",")
(evil-leader/set-key
	;; Window
	"0" 'delete-window
	"1" 'delete-other-windows
	"2" 'split-window-below
	"3" 'split-window-right
	"4" 'kill-buffer-and-window
	"c" 'ace-window
	"r" 'windresize
	;; Buffer
	"xk" 'kill-buffer
	"xK" 'kill-current-buffer
	"xb" 'switch-to-buffer
	"zK" 'kiteab/kill-unwanted-buffers
	"tn" 'previous-buffer
	"ti" 'next-buffer
	"zb" 'buffer-menu
	;; Configs
	"zc" 'open-etc-config
	"zi" 'open-config-file
	"zs" 'kiteab/search-engine
	"zw" 'window-move
	"ze" 'eshell
	"zE" 'kiteab/edit-snippets
	;; Plugins Keymap
	"m" 'magit-status
	"k" 'kiteab/open-or-close-command-log-mode
	"K" 'clm/command-log-clear
	"s" 'vc-msg-show
	;; Others
	"xe" 'eval-last-sexp)

(provide 'init-evil)
