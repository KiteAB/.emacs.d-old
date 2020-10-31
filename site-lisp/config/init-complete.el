;;; This file is used for Complete Settings
;;; Company (Complete Anything)
(use-package company
  :ensure t
  :hook (after-init-hook . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (if (eq major-mode 'emacs-lisp-mode)
      (setq company-idle-delay 30)
    (setq company-idle-delay 0))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous))
  (push 'company-capf company-backends)
  :bind ("C-' C-y" . yas-expand-from-trigger-key))

;;; C Headers Support
(use-package company-c-headers
  :ensure t
  :config (add-to-list 'company-backends 'company-c-headers))

;;; Beautify for Company
(use-package company-box
  :ensure t
  :hook (company-mode-hook . company-box-mode))

(provide 'init-complete)
