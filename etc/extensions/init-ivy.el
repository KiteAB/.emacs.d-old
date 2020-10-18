;;; This file is used for Ivy Settings
(use-package ivy
  :ensure t
  :defer 1
  :hook (after-init-hook . ivy-mode))

(use-package posframe
  :ensure t
  :defer 1
  :config (setq posframe-mouse-banish nil))

(use-package ivy-posframe
  :ensure t
  :defer 1
  :hook (ivy-mode-hook . ivy-posframe-mode)
  :config
  (setq ivy-posframe-display-functions-alist
        '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((left-fringe . 8)
                                  (add-hook 'ivy-mode-hook #'ivy-posframe-mode)))
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward)
         ("C-- s" . swiper-all)))

(provide 'init-ivy)
