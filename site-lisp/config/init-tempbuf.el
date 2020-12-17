;;; init-tempbuf.el --- Settings for tempbuf
;;; Code:
(use-package tempbuf
  :init
  (setq tempbuf-kill-message nil
        tempbuf-minimum-timeout 30)
  :hook ((compilation-mode-hook
          comint-mode-hook
          completion-list-mode-hook
          help-mode-hook
          Info-mode-hook
          calc-mode-hook) . (turn-on-tempbuf-mode)))

(provide 'init-tempbuf)

;;; init-tempbuf.el ends here
