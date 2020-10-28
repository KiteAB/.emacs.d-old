;;; This file is used for Awesome Tab Settings
(use-package awesome-tab
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tab"
  :disabled
  :hook (after-init-hook . awesome-tab-mode)
  :bind (("C-; g" . awesome-tab-switch-group)
         ("C-; N" . awesome-tab-select-beg-tab)
         ("C-; I" . awesome-tab-select-end-tab)
         ("C-; e" . awesome-tab-forward-group)
         ("C-; u" . awesome-tab-backward-group)
         ("C-; n" . awesome-tab-backward-tab)
         ("C-; i" . awesome-tab-forward-tab)
         ("C-; j" . awesome-tab-ace-jump)
         ("C-; C-m n" . awesome-tab-move-current-tab-to-left)
         ("C-; C-m i" . awesome-tab-move-current-tab-to-right)))

(provide 'init-awesome-tab)
