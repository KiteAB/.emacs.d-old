;;; init-clm.el --- Settings for command log mode
;;; Code:
(use-package command-log-mode
  :ensure t
  :config
  (defun kiteab/open-or-close-command-log-mode ()
    "Open the command-log-mode."
    (interactive)
    (global-command-log-mode)
    (clm/toggle-command-log-buffer))
  :bind (("C-' k" . kiteab/open-or-close-command-log-mode)
         ("C-' K" . clm/command-log-clear)))

(provide 'init-clm)

;;; init-clm.el ends here
