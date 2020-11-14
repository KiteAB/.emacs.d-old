;;; init-pacarch.el --- Settings for PacArch
;;; Code:
(leaf pacarch
  :load-path "~/.emacs.d/site-lisp/extensions/pacarch.el/"
  :bind
  ("C-' C-p u" . pacarch-upgrade-srcs-and-pkgs)
  ("C-' C-p i" . pacarch-install-pkg)
  :custom
  (pacarch-enforce-upgrade-srcs . t))

(provide 'init-pacarch)

;;; init-pacarch.el ends here
