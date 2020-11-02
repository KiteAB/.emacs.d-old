;;; This file is used for Insert Translated Name Settings
(use-package insert-translated-name
  :load-path "~/.emacs.d/site-lisp/extensions/insert-translated-name"
  :bind (("C-' C-l i" . insert-translated-name-insert)
         ("C-' C-l u" . insert-translated-name-insert-with-underline)
         ("C-' C-l c" . insert-translated-name-insert-with-camel)
         ("C-' C-l l" . insert-translated-name-insert-with-line)
         ("C-' C-l o" . insert-translated-name-insert-original-translation)
         ("C-' C-l r" . insert-translated-name-replace)
         ("C-' C-l U" . insert-translated-name-replace-with-underline)
         ("C-' C-l C" . insert-translated-name-replace-with-camel)
         ("C-' C-l L" . insert-translated-name-replace-with-line)))

(provide 'init-insert-translated-name)
