;;; This file is used for PYIM settings
(use-package pyim
  :ensure t
  :bind ("C-SPC" . toggle-input-method)
  :custom
  (default-input-method 'pyim)
  (pyim-default-scheme 'quanpin)
  (pyim-page-tooltip 'posframe)
  (pyim-page-length 5)
  (pyim-page-style 'one-line)
  (pyim-punctuation-translate-p '(no yes auto))
  (pyim-enable-shortcode nil)
  :config
  (use-package pyim-basedict
    :ensure t
    :config (pyim-basedict-enable))
  (pyim-isearch-mode t)
  (message ""))

(provide 'init-pyim)
