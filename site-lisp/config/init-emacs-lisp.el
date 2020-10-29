;;; This file is used for Emacs Lisp Settings
;;; Symbol Overlay
(use-package symbol-overlay
  :ensure t
  :hook (emacs-lisp-mode-hook . symbol-overlay-mode))

;;; Lispy
(use-package lispy
  :ensure t
  :hook ((lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook) . lispy-mode)
  :bind ("C-' L" . lispy-mode))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
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

(provide 'init-emacs-lisp)
