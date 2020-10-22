;;; This file is used for Program Settings
;;; Insert Translated Name
(use-package insert-translated-name
  :load-path "~/.emacs.d/site-lisp/insert-translated-name"
  :defer 1
  :bind (("C-' C-l i" . insert-translated-name-insert)
         ("C-' C-l u" . insert-translated-name-insert-with-underline)
         ("C-' C-l c" . insert-translated-name-insert-with-camel)
         ("C-' C-l l" . insert-translated-name-insert-with-line)
         ("C-' C-l o" . insert-translated-name-insert-original-translation)
         ("C-' C-l r" . insert-translated-name-replace)
         ("C-' C-l U" . insert-translated-name-replace-with-underline)
         ("C-' C-l C" . insert-translated-name-replace-with-camel)
         ("C-' C-l L" . insert-translated-name-replace-with-line)))

;;; JS2 Mode
(use-package js2-mode
  :ensure t
  :defer 1
  :hook (js-mode . js2-mode))

;;; Web Mode
(use-package web-mode
  :ensure t
  :defer 1
  :config
  (setq auto-mode-alist
        (append '(("\\.html\\'" . web-mode)) auto-mode-alist))
  (setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2)) ; Indent of JavaScript in HTML

;;; Emmet Mode
(use-package emmet-mode
  :ensure t
  :defer 1
  :hook (web-mode-hook . emmet-mode)
  :config (setq emmet-self-closing-tag-style " /"))

;;; FlyMake
(use-package flymake
  :ensure t
  :defer 1
  :bind (("C-' C-f" . flymake-mode)))

(provide 'init-prog)
