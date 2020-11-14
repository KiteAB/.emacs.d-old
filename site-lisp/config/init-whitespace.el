;;; init-whitespace.el --- Settings for WhiteSpace
;;; Code:
(leaf whitespace
  :hook emacs-lisp-mode-hook
  :config
  (whitespace-mode)
  (set-face-attribute 'whitespace-tab      nil :foreground "#444444" :background "#686868")
  (set-face-attribute 'whitespace-empty    nil :foreground "#cd8c95" :background "#8b5f65")
  (set-face-attribute 'whitespace-trailing nil :foreground "#79cdcd" :background "#668b8b")
  :custom
  (whitespace-style .
                    '(face tabs                     tab-mark
                           space-after-tab::space   space-before-tab::space
                           indentation::space
                           trailing                 empty))
  (whitespace-display-mappings .
                               '(;; "tab" char.      Display like "|   ".   Or Display like "\   "
                                 (tab-mark      9   [124 9]   [92 9])
                                 ;; " " char.        Display like "·".      Or Display like "_"
                                 (space-mark    32  [183]     [95])
                                 ;; "newline" char.  Display like "¬"       Or Display like "¶"
                                 (newline-mark  10  [172 10]  [182 10]))))

(provide 'init-whitespace)

;;; init-whitespace.el ends here
