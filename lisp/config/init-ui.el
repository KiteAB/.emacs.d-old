;;;; This file is used for emacs UI
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


;;; Awesome Tray
(use-package awesome-tray
  :load-path "~/.emacs.d/site-lisp/awesome-tray"
  :hook (after-init-hook . awesome-tray-mode)
  :config
  ;; Custom Modules
                                        ; Current Input Method
  (defun kiteab/current-input-method ()
    "Display current input method at awesome tray."
    (setq kiteab/current-input-method-en "EN")
    (setq kiteab/current-input-method-zh "ZH")
    (if (eq current-input-method nil)
        (concat kiteab/current-input-method-en)
      (concat kiteab/current-input-method-zh)))
  (defface kiteab/current-input-method-face
    '((((background light))
       :foreground "#cc2444" :bold t)
      (t
       :foreground "#ff2d55" :bold t))
    "Git face."
    :group 'awesome-tray)
  (add-to-list 'awesome-tray-module-alist '("current-input-method" . (kiteab/current-input-method kiteab/current-input-method-face)))
  ;; Set Modules
  (setq awesome-tray-active-modules '("git" "location" "current-input-method" "mode-name" "parent-dir" "buffer-name" "date")))

;;; Lazycat Themes
(use-package lazycat-theme :load-path "~/.emacs.d/site-lisp/lazycat-theme")

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

;;; Icons
(use-package all-the-icons
  :ensure t
  :bind (("C-' C-i" . all-the-icons-insert)))

(provide 'init-ui)
