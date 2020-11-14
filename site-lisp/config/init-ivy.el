;;; init-ivy.el --- Settings for Ivy
;;; Code:
(leaf ivy
  :ensure t
  :hook after-init-hook
  :config
  (ivy-mode))

;;; Posframe
(leaf posframe
  :ensure t
  :custom
  (posframe-mouse-banish . nil))

;;; Ivy Posframe
(leaf ivy-posframe
  :ensure t
  :hook ivy-mode-hook
  :config
  (ivy-posframe-mode)
  :custom
  (ivy-posframe-display-functions-alist . '((t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-parameters . '((left-fringe . 8)
                               (add-hook 'ivy-mode-hook 'ivy-posframe-mode)))
  :bind
  ("C-s" . swiper)
  ("C-r" . swiper-backward))

(provide 'init-ivy)

;;; init-ivy.el ends here
