;;; init-awesome-pair.el --- Settings for Awesome Pair
;;; Code:
(leaf awesome-pair
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-pair/"
  :hook emacs-lisp-mode-hook
  :config
  (awesome-pair-mode)
  :bind (:awesome-pair-mode-map
         ("(" . awesome-pair-open-round)
         ("[" . awesome-pair-open-bracket)
         ("{" . awesome-pair-open-curly)
         (")" . awesome-pair-close-round)
         ("]" . awesome-pair-close-bracket)
         ("}" . awesome-pair-close-curly)
         ("=" . awesome-pair-equal)

         ("%" . awesome-pair-match-paren)
         ("\"" . awesome-pair-double-quote)

         ("SPC" . awesome-pair-space)

         ("M-o" . awesome-pair-backward-delete)
         ("C-d" . awesome-pair-forward-delete)
         ("C-k" . awesome-pair-kill)

         ("M-\"" . awesome-pair-wrap-double-quote)
         ("M-[" . awesome-pair-wrap-bracket)
         ("M-{" . awesome-pair-wrap-curly)
         ("M-(" . awesome-pair-wrap-round)
         ("M-)" . awesome-pair-unwrap)

         ("M-p" . awesome-pair-jump-right)
         ("M-n" . awesome-pair-jump-left)
         ("M-:" . awesome-pair-jump-out-pair-and-newline)))

(provide 'init-awesome-pair)

;;; init-awesome-pair.el ends here
