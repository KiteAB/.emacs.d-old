;;; This file is used for PacArch Settings
(use-package pacarch
  :load-path "~/.emacs.d/site-lisp/extensions/pacarch.el"
  :bind (("C-' C-p u" . pacarch-upgrade-srcs-and-pkgs)
         ("C-' C-p i" . pacarch-install-pkg))
  :config
  (setq pacarch-enforce-upgrade-srcs t))

(provide 'init-pacarch)
