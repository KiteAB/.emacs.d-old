;;; This file is used for User Interface
;;; Basics
(menu-bar-mode -1) ; Close the menu bar
(tool-bar-mode -1) ; Close the tool bar
(scroll-bar-mode -1) ; Close Scroll bar
(tab-bar-mode -1) ; Set tab bar not display
(global-hl-line-mode t) ; Highlight current line
(setq tab-bar-show nil) ; Always not display tab bar

;;; Relative Line Numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(toggle-frame-fullscreen) ; Set fullscreen
(setq inhibit-splash-screen t) ; Close the startup screen

;;; Font
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

;;; Background Alpha
(unless (file-exists-p
         (expand-file-name (locate-user-emacs-file "not-alpha")))
  (set-frame-parameter nil 'alpha '(90 . 100)))

;;; Icons
(use-package all-the-icons :ensure t)

;;; Info Colors
(use-package info-colors
  :ensure t
  :hook (Info-selection-hook . info-colors-fontify-node))

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

;;; Rainbow Mode
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode-hook . rainbow-mode))

(provide 'init-ui)
