;;; This file is used for packages settings
;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :defer 1
  :hook ((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "chartreuse3"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "DodgerBlue1"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "DarkOrange2"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "deep pink"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "medium orchid" :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "turquoise"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "lime green"    :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "gold"          :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "cyan"          :bold "t"))

;;; Indent Guide
(use-package indent-guide
  :ensure t
  :defer 1
  :hook (after-init-hook . indent-guide-global-mode))

;;; Info Colors
(use-package info-colors
  :ensure t
  :defer 1
  :hook (Info-selection-hook . 'info-colors-fontify-node))

;;; NyanCat Mode
(use-package nyan-mode
  :ensure t
  :disabled
  :hook (after-init-hook . nyan-mode)
  :config (setq nyan-wavy-trail t
                nyan-animate-nyancat t))

;;; Page Break Lines
(use-package page-break-lines
  :ensure t
  :defer 1
  :hook (prog-mode-hook . page-break-lines-mode))

;;; Ivy
(use-package ivy
  :ensure t
  :defer 1
  :hook (after-init-hook . ivy-mode))

(use-package posframe
  :ensure t
  :defer 1
  :config (setq posframe-mouse-banish nil))

(use-package ivy-posframe
  :ensure t
  :defer 1
  :hook (ivy-mode-hook . ivy-posframe-mode)
  :config
  (setq ivy-posframe-display-functions-alist
        '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((left-fringe . 8)
                                  (add-hook 'ivy-mode-hook #'ivy-posframe-mode)))
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward)))

;;; Emacs Application Framework
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :defer 1
  :bind (("C-q C-w l" . eaf-open-browser))
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

;;; Company English Helper
(use-package company-english-helper
  :load-path "~/.emacs.d/site-lisp/company-english-helper"
  :config
  (load-file "~/.emacs.d/site-lisp/company-english-helper/company-english-helper-data.el")
  :bind (("C-' C-l s" . company-english-helper-search)))

;;; Auto Save
(use-package auto-save
  :load-path "~/.emacs.d/site-lisp/auto-save"
  :config
  (auto-save-enable)
  (setq auto-save-silent t
        auto-save-delete-trailing-whitespace t)
  (setq auto-save-disable-predicates
      '((lambda ()
      (string-suffix-p
      "gpg"
      (file-name-extension (buffer-name)) t)))))

;;; VTerm
(use-package vterm
  :ensure t
  :defer 1
  :config
  (define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
  (define-key vterm-mode-map (kbd "C-c n") 'next-buffer))

;;; Counsel
(use-package counsel
  :ensure t
  :defer 1
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)))

;;; Which Key
(use-package which-key
  :ensure t
  :defer 1
  :hook (after-init-hook . which-key-mode)
  :config (setq which-key-idle-delay 0.65))

;;; Ace Window
(use-package ace-window
  :ensure t
  :defer 1
  :bind (("C-' C-c" . ace-window)))

;;; Window Resize
(use-package windresize
  :ensure t
  :defer 1
  :bind (("C-' C-r" . windresize)))

;;; Multiple Cursor
(use-package multiple-cursors
  :ensure t
  :defer 1
  :bind (("C-M-l" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-m" . newline)))

;;; Youdao Dictionary
(use-package youdao-dictionary
  :ensure t
  :defer 1
  :bind (("C-' t" . youdao-dictionary-search-at-point)))

;;; Figlet
(use-package figlet :ensure t)

;;; Dired - File Operations
(use-package dired
  :ensure nil
  :defer 1
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

  (define-key dired-mode-map "Y" 'ora-dired-rsync))

;;; Auto Revert
(use-package autorevert
  :ensure nil
  :defer 1
  :hook (after-init-hook . global-auto-revert-mode))

;;; Command Log
(use-package command-log-mode
  :ensure t
  :defer 1
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
  :defer 1
  :bind (("C-' A" . align-regexp)))

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
  :defer 1
  :bind (("C-' c d" . comment-dwin)
         ("C-' c l" . comment-line)
         ("C-' c b" . comment-box)))

;;; Winner Mode
(use-package winner-mode
  :ensure nil
  :defer 1
  :hook (after-init-hook . winner-mode))

;;; Recentf
(use-package recentf
  :ensure nil
  :defer 1
  :hook (after-init-hook . recentf-mode)
  :bind (("C-' r" . recentf-open-files)))

;;; Frog Jump Buffer
(use-package frog-jump-buffer
  :ensure t
  :defer 1
  :bind (("C-' b" . frog-jump-buffer)))

;;; Helpful
(use-package helpful
  :ensure t
  :disabled
  :defer 1
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

;;; Smex
(use-package smex
  :ensure t
  :defer 1
  :bind (("M-X" . smex)))

;;; WhiteSpace
(use-package whitespace
  :ensure nil
  :defer 1
  :hook (prog-mode-hook . whitespace-mode)
  :config
  (setq whitespace-style
        '(face tabs                     tab-mark
               space-after-tab::space   space-before-tab::space
               indentation::space
               trailing                 empty))
  (setq whitespace-display-mappings
        '(;; "tab" char.      Display like "|   ".   Or Display like "\   "
          (tab-mark      9   [124 9]   [92 9])
          ;; " " char.        Display like "·".      Or Display like "_"
          (space-mark    32  [183]     [95])
          ;; "newline" char.  Display like "¬"       Or Display like "¶"
          (newline-mark  10  [172 10]  [182 10])))
  (set-face-attribute 'whitespace-tab      nil :foreground "#444444" :background "#686868")
  (set-face-attribute 'whitespace-empty    nil :foreground "#cd8c95" :background "#8b5f65")
  (set-face-attribute 'whitespace-trailing nil :foreground "#79cdcd" :background "#668b8b"))

;;; Rotate Window
(use-package rotate
  :ensure t
  :defer 1
  :bind (("C-' l r" . rotate-window)
         ("C-' l l" . rotate-layout)))

;;; PYIM
(use-package pyim
  :ensure t
  :defer 1
  :bind (("C-SPC" . toggle-input-method))
  :config
  (use-package pyim-basedict
    :ensure t
    :config (pyim-basedict-enable))
  (setq default-input-method 'pyim
        pyim-default-scheme 'quanpin
        pyim-page-tooltip 'posframe
        pyim-page-length 5
        pyim-page-style 'one-line
        pyim-punctuation-translate-p '(no yes auto)
        pyim-enable-shortcode nil)
  (pyim-isearch-mode t)
  (message ""))

;;; Lispy
(use-package lispy
  :ensure t
  :defer 1
  :hook ((lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook) . lispy-mode))

;;; Yasnippets
;;; Insert Translated Name
(use-package insert-translated-name
  :load-path "~/.emacs.d/site-lisp/insert-translated-name"
  :defer 1
  :bind (("C-' C-l i" . insert-translated-name-insert)
         ("C-' C-l u" . insert-translated-name-insert-with-underline)
         ("C-' C-l c" . insert-translated-name-insert-with-camel)
         ("C-' C-l l" . insert-translated-name-insert-with-line)
         ("C-' C-l o" . insert-translated-name-insert-original-translation)
         ("C-' C-l r" . insert-translated-name-replace)
         ("C-' C-l U" . insert-translated-name-replace-with-underline)
         ("C-' C-l C" . insert-translated-name-replace-with-camel)
         ("C-' C-l L" . insert-translated-name-replace-with-line)))




(provide 'init-packages)
