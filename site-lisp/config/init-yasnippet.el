;;; This file is used for Yasnippet Settings
(use-package yasnippet
  :ensure t
  :bind ("C-' C-y" . yas-expand-from-trigger-key)
  :hook (after-init-hook . yas-global-mode)
  :config
  (use-package yasnippet-snippets :ensure t)
  (setq yas-snippet-dirs '("~/.emacs.d/site-lisp/snippets"
                           "~/.emacs.d/elpa/yasnippet-snippets-20201025.1809/snippets")))

(provide 'init-yasnippet)
