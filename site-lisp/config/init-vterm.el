;;; init-vterm.el --- Settings for Vterm
;;; Code:
(leaf vterm
  :ensure t
  :bind (:vterm-mode-map
         ("C-c p" . previous-buffer)
         ("C-c n" . next-buffer)))

(provide 'init-vterm)

;;; init-vterm.el ends here
