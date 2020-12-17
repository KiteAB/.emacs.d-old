;;; init-youdao-dict.el --- Settings for youdao dictionary
;;; Code:
(use-package youdao-dictionary
  :ensure t
  :bind ("C-' t" . youdao-dictionary-search-at-point))

(provide 'init-youdao-dict)

;;; init-youdao-dict.el ends here
