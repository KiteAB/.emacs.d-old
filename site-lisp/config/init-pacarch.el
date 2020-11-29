;;; init-pacarch.el --- Settings for pacarch
;;; Code:
(use-package pacarch
  :load-path "~/.emacs.d/site-lisp/extensions/pacarch"
  :bind (("C-' C-p u" . pacarch-upgrade-srcs-and-pkgs)
         ("C-' C-p i" . pacarch-install-pkg))
  :config
  (setq pacarch-enforce-upgrade-srcs t))

(provide 'init-pacarch)

;;; init-pacarch.el ends here
