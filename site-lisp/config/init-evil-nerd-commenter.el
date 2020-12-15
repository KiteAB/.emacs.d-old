;;; init-evil-nerd-commenter.el --- Settings for evil nerd commenter
;;; Code:
(use-package evil-nerd-commenter
  :ensure t
  :bind ("C-' C-c" . evilnc-comment-or-uncomment-lines))

(provide 'init-evil-nerd-commenter)

;;; init-evil-nerd-commenter.el ends here
