;;; init-isearch.el --- Settings for i-search
;;; Code:
(use-package isearch
  :config
  (setq isearch-lazy-count t
        lazy-count-prefix-format "%s/%s ")
  :bind (("C-S" . isearch-forward)
         ("C-R" . isearch-backward)))

(provide 'init-isearch)

;;; init-isearch.el ends here
