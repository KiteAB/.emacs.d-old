;;; This file is used for Ivy Settings
;;; Ivy
(use-package ivy
  :ensure t
  :hook (after-init-hook . ivy-mode))

;;; Posframe
(use-package posframe
  :ensure t
  :config (setq posframe-mouse-banish nil))

;;; Ivy Posframe
(use-package ivy-posframe
  :ensure t
  :hook (ivy-mode-hook . ivy-posframe-mode)
  :config
  (setq ivy-posframe-display-functions-alist
        '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((left-fringe . 8)
                                  (add-hook 'ivy-mode-hook 'ivy-posframe-mode)))
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward)))

(provide 'init-ivy)
