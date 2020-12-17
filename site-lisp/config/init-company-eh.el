;;; init-company-eh.el --- Settings for company english helper
;;; Code:
(use-package company-english-helper
  :load-path "~/.emacs.d/site-lisp/extensions/company-english-helper"
  :config
  (load-file "~/.emacs.d/site-lisp/extensions/company-english-helper/company-english-helper-data.el")
  :bind ("C-' C-l s" . company-english-helper-search))

(provide 'init-company-eh)

;;; init-company-eh.el ends here
