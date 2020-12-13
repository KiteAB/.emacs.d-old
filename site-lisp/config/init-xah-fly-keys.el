;;; init-xah-fly-keys.el --- Settings for xah fly keys
;;; Code:
(use-package xah-fly-keys
  :ensure t
  :hook (after-init-hook . xah-fly-keys)
  :config
  (xah-fly-keys-set-layout "colemak")

  (add-hook 'magit-mode-hook #'(lambda () (interactive) (xah-fly-keys -1)))

  (define-key xah-fly-insert-map  [escape]     #'xah-fly-command-mode-activate)
  (define-key xah-fly-insert-map  (kbd "C-n") #'(lambda () (interactive) (next-line)))

  (define-key xah-fly-command-map (kbd "U")   #'(lambda () (interactive) (previous-line 5)))
  (define-key xah-fly-command-map (kbd "E")   #'(lambda () (interactive) (next-line 5)))
  (define-key xah-fly-command-map (kbd "N")   #'(lambda () (interactive) (beginning-of-line)))
  (define-key xah-fly-command-map (kbd "I")   #'(lambda () (interactive) (end-of-line)))
  (define-key xah-fly-command-map (kbd "C-n") #'(lambda () (interactive) (next-line)))
  (define-key xah-fly-command-map (kbd "C-a") #'(lambda () (interactive) (beginning-of-line)))
  (define-key xah-fly-command-map (kbd "S")   #'(lambda () (interactive) (save-buffer)))
  (define-key xah-fly-command-map (kbd "Q")   #'(lambda () (interactive) (kill-current-buffer)))
  (define-key xah-fly-command-map (kbd "A")   #'(lambda () (interactive) (end-of-line) (xah-fly-insert-mode-activate)))
  (define-key xah-fly-command-map (kbd "K")   #'(lambda () (interactive) (beginning-of-line) (xah-fly-insert-mode-activate)))
  (define-key xah-fly-command-map (kbd "k")   #'(lambda () (interactive) (xah-fly-insert-mode-activate))))

(provide 'init-xah-fly-keys)

;;; init-xah-fly-keys.el ends here
