;;; This file is used for I-Search Settings
(use-package isearch
  :config
  (setq isearch-lazy-count t
        lazy-count-prefix-format "%s/%s ")
  :bind (("C-S" . isearch-forward)
         ("C-R" . isearch-backward)))

(provide 'init-isearch)
