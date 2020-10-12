;;;; This file is used for emacs UI
(menu-bar-mode -1) ; Close the menu bar
(tool-bar-mode -1) ; Close the tool bar
(scroll-bar-mode -1) ; Close Scroll bar
(tab-bar-mode -1) ; Set tab bar not display
;; (display-battery-mode t) ; Display battery status
(global-hl-line-mode t) ; Highlight current line
(setq tab-bar-show nil) ; Always not display tab bar
(progn
  (setq display-line-numbers-type 'relative) ; Relative numbers for display numbers mode
  (global-display-line-numbers-mode t)) ; Set the line numbers
(toggle-frame-fullscreen) ; Set fullscreen
(setq inhibit-splash-screen t) ; Close the startup screen

;; (set-face-attribute
;;  'default nil
;;  :height 160
;;  :family "Fira Code Nerd Font"
;;  :weight 'normal
;;  :width 'normal) ; Set the font size

(setq kiteab/font-name "Sarasa Mono Slab SC Semibold"
      kiteab/font-style "Regular"
      kiteab/font-size 22)
(if (fontp (font-spec
            :name kiteab/font-name
            :style kiteab/font-style
            :size kiteab/font-size))
    (progn
      (set-face-attribute 'default nil
                          :font (font-spec
                                 :name kiteab/font-name
                                 :style kiteab/font-style
                                 :size kiteab/font-size))
      (set-fontset-font t ?中 (font-spec
                               :name kiteab/font-name
                               :style kiteab/font-style
                               :size kiteab/font-size)))
  (message "Can't find %s font. You can install it or ignore this message at init-ui.el" kiteab/font-name))

;; Set backgroup alpha
(unless (file-exists-p
         (expand-file-name (locate-user-emacs-file "not-alpha")))
  (set-frame-parameter nil 'alpha '(90 . 100)))

;;; Awesome Tray
(use-package awesome-tray
  :load-path "~/.emacs.d/site-lisp/awesome-tray"
  :hook (after-init-hook . awesome-tray-mode)
  :config
  ;; Custom Modules
  (defun kiteab/current-input-method ()
    "Display current input method at awesome tray."
    (if (eq current-input-method nil)
        (concat "EN")
      (concat "ZH")))
  (add-to-list 'awesome-tray-module-alist '("current-input-method" . (kiteab/current-input-method kiteab/current-input-method-face)))
  ;; Set Modules
  (setq awesome-tray-active-modules '("git" "location" "current-input-method" "mode-name" "parent-dir" "buffer-name" "date")))

;;; Lazycat Themes
(use-package lazycat-theme
  :load-path "~/.emacs.d/site-lisp/lazycat-theme")

;;; Spacemacs Themes
(use-package spacemacs-common
  :ensure spacemacs-theme
  :defer
; :config
; (setq-default cursor-type '(bar . 1))
; (set-cursor-color "white")
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
  (setq-default cursor-type '(bar . 2)))

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

;;; Icons
(use-package all-the-icons
  :ensure t
  :bind (("C-' C-i" . all-the-icons-insert)))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :defer 1
  :hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "chartreuse3"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "DodgerBlue1"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "DarkOrange2"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "deep pink"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "medium orchid" :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "turquoise"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "lime green"    :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "gold"          :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "cyan"          :bold "t"))

;;; Indent Guide
(use-package indent-guide
  :ensure t
  :defer 1
  :hook (after-init-hook . indent-guide-global-mode))

;;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :disabled
  :hook (after-init-hook . doom-modeline-mode)
  :config
  (setq-default doom-modeline-height 13)
  (setq-default doom-modeline-bar-width 3))

;;; Info Colors
(use-package info-colors
  :ensure t
  :defer 1
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
  :defer 1
  :hook (prog-mode-hook . page-break-lines-mode))

(provide 'init-ui)
