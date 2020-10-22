;;; This file is used for Completion Settings
;;; Company (Complete Anything)
(use-package company
  :ensure t
  :defer 1
  :hook (after-init-hook . global-company-mode)
  :config
  (setq company-idle-delay 3
        company-minimum-prefix-length 1)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))
  (push 'company-capf company-backends)
  :bind (("C-' C-y" . yas-expand-from-trigger-key)))
;;; Child Packages
(use-package company-c-headers
  :ensure t
  :config (add-to-list 'company-backends 'company-c-headers))
(use-package company-box
  :ensure t
  :hook (company-mode-hook . company-box-mode))

;;; Lsp Mode
(use-package lsp-mode
  :ensure t
  :defer 1
  :hook ((c-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
  :bind (("C-' F" . lsp-format-buffer))
  :config
  (setq lsp-idle-delay 1200
        lsp-auto-guess-root nil
        lsp-file-watch-threshold 2000
        lsp-eldoc-hook nil
        lsp-log-io nil
        lsp-enable-folding nil
        lsp-enable-snippet nil
        lsp-prefer-flymake :none))

;;; Lispy
(use-package lispy
  :ensure t
  :defer 1
  :hook ((lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook) . lispy-mode))

;;; Dap Mode
(use-package dap-mode
  :ensure t
  :defer 1
  :bind (("C-' d" . dap-debug)
         ("<f5>" . dap-breakpoint-toggle)
         ("<f6>" . dap-continue)))

;;; Snippets
(use-package yasnippet
  :ensure t
  :defer 1
  :bind (("C-' C-y" . yas-expand-from-trigger-key))
  :hook (after-init-hook . yas-global-mode)
  :config
  (use-package yasnippet-snippets :ensure t)
  (setq yas-snippet-dirs '("~/.emacs.d/etc/snippets"
                           "~/.emacs.d/var/elpa/yasnippet-snippets-20200909.1058/snippets")))

(provide 'init-complete)
