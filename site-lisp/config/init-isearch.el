;;; init-isearch.el --- Settings for I-Search
;;; Code:
(leaf isearch
  :custom
  (isearch-lazy-count . t)
  (lazy-count-prefix-format . "%s/%s ")
  :bind
  ("C-S" . isearch-forward)
  ("C-R" . isearch-backward))

(provide 'init-isearch)

;;; init-isearch.el ends here
