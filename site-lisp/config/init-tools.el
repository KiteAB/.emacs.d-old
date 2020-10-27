;;; This file is used for Tools Settings
;;; Auto Save
(use-package auto-save
  :load-path "~/.emacs.d/site-lisp/extensions/auto-save"
  :config
  (auto-save-enable)
  (setq auto-save-silent t
        auto-save-delete-trailing-whitespace t)
  (setq auto-save-disable-predicates
      '((lambda ()
      (string-suffix-p
      "gpg"
      (file-name-extension (buffer-name)) t)))))

;;; Emacs Application Framework
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/extensions/emacs-application-framework"
  :bind ("C-q C-w l" . eaf-open-browser)
  :config
  (eaf-setq eaf-browser-remember-history "true")
  (eaf-setq eaf-browser-default-zoom "1.5")
  (defalias 'browse-web #'eaf-open-browser)
  (if (and
       (< (car (circadian-sunrise))
          (car (circadian-now-time)))
       (> (car (circadian-sunset))
          (car (circadian-now-time))))
      (eaf-setq eaf-browser-dark-mode "false")
    (eaf-setq eaf-browser-dark-mode "true")))

;;; FlyMake
(use-package flymake
  :ensure t
  :bind ("C-' C-f" . flymake-mode))

;;; VTerm
(use-package vterm
  :ensure t
  :config
  (define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
  (define-key vterm-mode-map (kbd "C-c n") 'next-buffer))

;;; Counsel
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)))

;;; Which Key
(use-package which-key
  :ensure t
  :hook (after-init-hook . which-key-mode)
  :config (setq which-key-idle-delay 0.65))

;;; Ace Window
(use-package ace-window
  :ensure t
  :bind ("C-' C-c" . ace-window))

;;; Window Resize
(use-package windresize
  :ensure t
  :bind ("C-' C-r" . windresize))

;;; Multiple Cursor
(use-package multiple-cursors
  :ensure t
  :bind (("C-M-l" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-m" . newline)))

;;; Figlet
(use-package figlet :ensure t)

;;; Auto Revert
(use-package autorevert
  :ensure nil
  :hook (after-init-hook . global-auto-revert-mode))

;;; Command Log
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

;;; Align
(use-package align
  :ensure nil
  :bind ("C-' A" . align-regexp))

;;; I-search
(use-package isearch
  :ensure nil
  :disabled
  :config
  (setq isearch-lazy-count t
        lazy-count-prefix-format "%s/%s "))

;;; New Comment
(use-package newcomment
  :ensure nil
  :bind (("C-' c d" . comment-dwin)
         ("C-' c l" . comment-line)
         ("C-' c b" . comment-box)))

;;; Winner Mode
(use-package winner-mode
  :ensure nil
  :hook (after-init-hook . winner-mode))

;;; Recentf
(use-package recentf
  :ensure nil
  :hook (after-init-hook . recentf-mode)
  :bind ("C-' r" . recentf-open-files))

;;; Frog Jump Buffer
(use-package frog-jump-buffer
  :ensure t
  :bind ("C-' b" . frog-jump-buffer))

;;; Helpful
(use-package helpful
  :ensure t
  :disabled
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

;;; Smex
(use-package smex
  :ensure t
  :bind ("M-X" . smex))

;;; Rotate Window
(use-package rotate
  :ensure t
  :bind (("C-' l r" . rotate-window)
         ("C-' l l" . rotate-layout)))

;;; Ace Jump
(use-package ace-jump-mode
  :ensure t
  :bind (("C-' C-a SPC" . ace-jump-mode)
         ("C-' C-a w" . ace-jump-word-mode)
         ("C-' C-a c" . ace-jump-char-mode)))

(provide 'init-tools)
