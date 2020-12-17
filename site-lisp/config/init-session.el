;;; init-session.el --- Settings for emacs session
;;; Code:
(require 'auto-save)
(require 'basic-toolkit)

(setq desktop-load-locked-desktop t) ; don't popup dialog ask user, load anyway
(setq desktop-restore-frames nil)    ; don't restore any frame

(defun emacs-session-restore ()
  "Restore emacs session."
  (interactive)
  (ignore-errors
    ;; Kill other windows.
    (delete-other-windows)
    ;; Kill unused buffers.
    (kill-unused-buffers)
    ;; Restore session.
    (desktop-read "~/.emacs.d/")))

(defun emacs-session-save (&optional arg)
  "Save emacs session."
  (interactive "p")
  (ignore-errors
    (if (equal arg 4)
        ;; Kill all buffers if with prefix argument.
        (mapc 'kill-buffer (buffer-list))
      ;; Kill unused buffers.
      (kill-unused-buffers)
      ;; Save all buffers before exit.
      (auto-save-buffers))
    ;; Save session.
    (make-directory "~/.emacs.d/" t)
    (desktop-save "~/.emacs.d/")
    ;; Exit emacs.
    (kill-emacs)))

(provide 'init-session)

;;; init-session.el ends here
