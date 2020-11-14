;;; init-company-english-helper.el --- Settings for Company English Helper
;;; Code:
(leaf company-english-helper
  :load-path "~/.emacs.d/site-lisp/extensions/company-english-helper"
  :config
  (load-file "~/.emacs.d/site-lisp/extensions/company-english-helper/company-english-helper-data.el")
  :bind
  ("C-' C-l s" . company-english-helper-search))

(provide 'init-company-english-helper)

;;; init-company-english-helper.el ends here
