;;; init-evil.el --- Settings for evil
;;; Code:
(defun evil-change-to-emacs-state ()
  "Change current state to Emacs state."
  (interactive)
  (evil-change-state 'emacs))

(use-package evil-leader
  :ensure t
  :disabled
  :hook (after-init-hook . global-evil-leader-mode))

(use-package evil
  :ensure t
  :disabled
  :hook ((global-evil-leader-mode-hook . evil-mode)
         (Info-selection-hook . evil-change-to-emacs-state)))

(use-package evil-nerd-commenter
  :ensure t)




(provide 'init-evil)

;;; init-evil.el ends here
