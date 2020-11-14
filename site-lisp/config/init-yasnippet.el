;;; init-yasnippet.el --- Settings for Yasnippet
;;; Code:
(leaf yasnippet-snippets :ensure t)
(leaf yasnippet
  :ensure t
  :disabled t
  :bind
  ("C-' C-y" . yas-expand-from-trigger-key)
  :hook after-init-hook
  :config
  (yas-global-mode)
  :custom
  (yas-snippet-dirs . '("~/.emacs.d/site-lisp/snippets"
                        "~/.emacs.d/elpa/yasnippet-snippets-20201025.1809/snippets")))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
