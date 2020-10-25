;;; This file is used for Other Programming Language's Settings
;;; JS2 Mode
(use-package js2-mode
  :ensure t
  :hook (js-mode . js2-mode))

;;; Web Mode
(use-package web-mode
  :ensure t
  :config
  (setq auto-mode-alist
        (append '(("\\.html\\'" . web-mode)) auto-mode-alist))
  (setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2)) ; Indent of JavaScript in HTML

;;; Emmet Mode
(use-package emmet-mode
  :ensure t
  :hook (web-mode-hook . emmet-mode)
  :config (setq emmet-self-closing-tag-style " /"))

;;; Indent Guide
(use-package indent-guide
  :ensure t
  :defer 1
  :hook (prog-mode-hook . indent-guide-global-mode))

;;; Smartparens
(use-package smartparens
  :ensure t
  :hook ((c-mode-hook c++-mode-hook python-mode-hook) . smartparens-mode))

(provide 'init-prog)
