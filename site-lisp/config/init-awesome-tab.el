;;; This file is used for Awesome Tab Settings
(use-package awesome-tab
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tab"
  :disabled
  :hook (after-init-hook . awesome-tab-mode)
  :bind (("C-' C-t g" . awesome-tab-switch-group)
         ("C-' C-t B" . awesome-tab-select-beg-tab)
         ("C-' C-t f" . awesome-tab-forward-group)
         ("C-' C-t E" . awesome-tab-select-end-tab)
         ("C-' C-t b" . awesome-tab-backward-group)
         ("C-' C-t n" . awesome-tab-backward-tab)
         ("C-' C-t i" . awesome-tab-forward-tab)
         ("C-' C-t a" . awesome-tab-ace-jump)))

(provide 'init-awesome-tab)
