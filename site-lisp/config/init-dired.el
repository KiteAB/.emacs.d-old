;;; init-dired.el --- Settings for Dired
;;; Code:
(leaf dired
  :config
  (define-advice dired-do-print (:override (&optional _))
    "Show/hide dotfiles."
    (interactive)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p)
        (progn
          (setq-local dired-dotfiles-show-p nil)
          (dired-mark-files-regexp "^\\.")
          (dired-do-kill-lines))
      (revert-buffer)
      (setq-local dired-dotfiles-show-p t)))
  (defun ora-dired-rsync (dest)
    (interactive
     (list
      (expand-file-name
       (read-file-name
        "Rsync to:"
        (dired-dwim-target-directory)))))
    ;; store all selected files into "files" list
    (let ((files (dired-get-marked-files
                  nil current-prefix-arg))
          ;; the rsync command
          (tmtxt/rsync-command
           "rsync -arvz --progress "))
      ;; add all selected file names as arguments
      ;; to the rsync command
      (dolist (file files)
        (setq tmtxt/rsync-command
              (concat tmtxt/rsync-command
                      (shell-quote-argument file)
                      " ")))
      ;; append the destination
      (setq tmtxt/rsync-command
            (concat tmtxt/rsync-command
                    (shell-quote-argument dest)))
      ;; run the async shell command
      (async-shell-command tmtxt/rsync-command "*rsync*")
      ;; finally, switch to that window
      (other-window 1)))

  (require 'dired-x) ; Use dired-x to add the `C-x C-j` keymap
  (put 'dired-find-alternate-file 'disabled nil) ; Don't let dired-mode create a new buffer for the dir
  :bind (:dired-mode-map
         ("Y" . ora-dired-rsync)
         ("RET" . dired-find-alternate-file)))

(provide 'init-dired)

;;; init-dired.el ends here
