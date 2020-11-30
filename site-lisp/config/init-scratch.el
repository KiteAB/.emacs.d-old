;;; init-scratch.el --- Settings for *scratch* buffer
;;; Code:
(setq kiteab/system-type (if (eq system-type 'gnu/linux)
                             "GNU/Linux"
                           (if (eq system-type 'gnu)
                               "GNU Hurd System"
                             (if (eq system-type 'gnu/kfreebsd)
                                 "FreeBSD"
                               (if (eq system-type 'darwin)
                                   "macOS"
                                 (if (or (eq system-type 'windows-nt) (eq system-type 'cygwin))
                                     "Windows"))))))
(setq initial-scratch-message (format ";;; KiteAB Emacs on %s
;; Emacs Startup Time: %.2fs, With %s Garbage Collects
;; %s Packages Installed, %s Features Required

" kiteab/system-type
(float-time (time-subtract after-init-time before-init-time))
gcs-done
(length package-activated-list)
(length features)))

(provide 'init-scratch)

;;; init-scratch.el ends here
