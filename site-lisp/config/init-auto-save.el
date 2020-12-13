;;; init-auto-save.el --- Settings for auto save
;;; Code:
(setq make-backup-files nil           ; Don't let Emacs make up backup file
      create-lockfiles nil            ; Don't make lockfile
      auto-save-default nil           ; Don't auto save the file
      auto-save-list-file-prefix nil) ; Don't make auto-save-list folder

(use-package auto-save
  :load-path "~/.emacs.d/site-lisp/extensions/auto-save"
  :demand
  :config
  (auto-save-enable)
  (setq auto-save-silent t
        auto-save-delete-trailing-whitespace t)
  (setq auto-save-disable-predicates
        '((lambda ()
            (string-suffix-p
             "gpg"
             (file-name-extension (buffer-name)) t)))))

(provide 'init-auto-save)

;;; init-auto-save.el ends here
