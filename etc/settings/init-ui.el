;;;; This file is used for emacs UI
(menu-bar-mode -1) ; Close the menu bar
(tool-bar-mode -1) ; Close the tool bar
(scroll-bar-mode -1) ; Close Scroll bar
(tab-bar-mode -1) ; Set tab bar not display
(display-battery-mode t) ; Display battery status
(global-hl-line-mode t) ; Highlight current line
(setq tab-bar-show nil) ; Always not display tab bar
(global-display-line-numbers-mode t) ; Show the line number
(global-hl-line-mode t) ; Highlight the current line
(toggle-frame-fullscreen) ; Set fullscreen
(setq inhibit-splash-screen t) ; Close the start flash
(set-face-attribute
 'default nil
 :height 160
 :family "Fira Code Nerd Font Mono"
 :weight 'normal
 :width 'normal) ; Set the font size
;; Set backgroup alpha
(unless (file-exists-p
				 (expand-file-name (locate-user-emacs-file "not-alpha")))
	(set-frame-parameter nil 'alpha '(90 . 100)))

(provide 'init-ui)
