;;; init-company-mode.el --- Settings for Company Mode
;;; Code:
(leaf company
  :ensure t
  :hook after-init-hook
  :config
  (global-company-mode)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous))
  (push 'company-capf company-backends)
  :bind
  ("C-' C-y" . yas-expand-from-trigger-key)
  :custom
  (company-minimum-prefix-length . 1)
  (company-idle-delay . 30))

;;; Beautify
(leaf company-box
  :ensure t
  :hook company-mode-hook
  :config
  (company-box-mode))

(provide 'init-company-mode)

;;; init-company-mode.el ends here
