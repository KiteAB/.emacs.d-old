;;; init-youdao-dictionary.el --- Settings for youdao dictionary
;;; Code:
(use-package youdao-dictionary
  :ensure t
  :bind ("C-' t" . youdao-dictionary-search-at-point))

(provide 'init-youdao-dictionary)

;;; init-youdao-dictionary.el ends here
