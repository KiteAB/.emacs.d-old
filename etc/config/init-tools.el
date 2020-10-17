;;; This file is used for Tools Settings
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
  :disabled
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

;;; Ivy
(use-package ivy
  :ensure t
  :defer 1
  :hook (after-init-hook . ivy-mode))
;;; Child Packages
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
         ("C-r" . swiper-backward)
         ("C-- s" . swiper-all)))

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

;;; Iedit
(use-package iedit
  :ensure t
  :defer 1
  :bind (("C-' C-e" . iedit-mode)))

;;; Hungry Delete
(use-package hungry-delete
  :ensure t
  :defer 1
  :bind (("C-' C-h" . hungry-delete-mode)
         ("C-' DEL" . hungry-delete-backward))
  :hook ((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))

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

;;; Youdao Translate
(use-package youdao-dictionary
  :ensure t
  :defer 1
  :bind (("C-' t" . youdao-dictionary-search-at-point)))

;;; Treemacs - File Explore
(use-package treemacs
  :ensure t
  :defer 1
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         25)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
;;; Child Packages
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
(use-package treemacs-icons-dired
  :disabled
  :after treemacs
  :ensure t
  :config (treemacs-icons-dired-mode))
(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;;; Git Gutter
(use-package git-gutter
  :ensure t
  :disabled
  :custom
  (git-gutter:update-interval 1)
  (git-gutter:added-sign "+")
  (git-gutter:deleted-sign "_")
  (git-gutter:modified-sign "~")
  (git-gutter:hide-gutter t)
  :config
  (global-git-gutter-mode +1)
  (set-face-foreground 'git-gutter:added "#8CFF88")
  (set-face-foreground 'git-gutter:modified "#8CFF88")
  (set-face-foreground 'git-gutter:deleted "#FF2323"))

;;; Pacman in Emacs
(use-package arch-packer :ensure t :defer 1)

;;; Figlet
(use-package figlet
  :ensure t
  :defer 1
  :bind (("C-' F" . figlet)))

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
;;; Child Package
(use-package all-the-icons-dired :ensure t :defer 1)

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

;;; Telega
(use-package telega
  :ensure t
  :commands telega
  :defer 1
  :init (setq telega-proxies
              '((:server "localhost"
                         :port 1089
                         :enable t
                         :type (:@type "proxyTypeSocks5"
                                       ))))
  (setq telega-chat-fill-column 65))
;;; Child Package
(use-package emojify
  :ensure t
  :defer 1
  :custom (emojify-emojis-dir "~/.emacs.d/var/emojis")
  :hook telega-mode)

(provide 'init-tools)
