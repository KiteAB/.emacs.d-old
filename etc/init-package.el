;;;; This file is used for packages configuration and more
;;; Set the plugin keybinding
(define-prefix-command 'plugin-key)
(global-set-key (kbd "C-'") 'plugin-key)

;;;; Themes
(load-the-theme)

;;; Third-party
;;; Emacs Application Framework
(package-require
 'eaf
 :outside
 :before-load-eval '(add-to-list 'load-path "~/.emacs.d/third-party/emacs-application-framework")
 :keymap '(("C-z C-w l" . eaf-open-browser)
					 ("C-z C-w h" . eaf-open-browser-with-history)
					 ("C-z C-m b" . eaf-open-bookmark))
 :delay-eval '(progn
								(eaf-setq eaf-browser-remember-history "true")
								(eaf-setq eaf-browser-default-zoom "1.0")
								(defun eaf-browser-set ()
									(interactive)
									(if (day-or-night)
											(eaf-setq eaf-browser-dark-mode "false")
										(eaf-setq eaf-browser-dark-mode "true")))
								(eaf-browser-set)))

;;; English Teacher
(package-require
 'english-teacher
 :outside
 :before-load-eval '(add-to-list 'load-path "~/.emacs.d/third-party/english-teacher.el")
 :keymap '(("C-' C-l" . english-teacher-smart-translation))
 :delay-eval '(setq english-teacher-backend 'baidu
										english-teacher-show-result-function 'english-teacher-eldoc-show-result-function)
 :hook '((Info-mode-hook eww-mode-hook help-mode-hook) . english-teacher-follow-mode))

;;; Netease Cloud Music
(package-require
 'netease-cloud-music
 :outside
 :before-load-eval '(add-to-list 'load-path "~/.emacs.d/third-party/netease-cloud-music.el")
 :keymap '(("C-' C-m t" . netease-cloud-music)
					 ("C-' C-m r" . netease-cloud-music-change-repeat-mode)))
;;; Child package
(package-require 'request)


;;; Dashboard
(package-require
 'dashboard
 :delay-eval '(progn
								(dashboard-setup-startup-hook)
								(setq dashboard-banner-logo-title "Live in Emacs!")
								(setq dashboard-startup-banner 'logo)
								(setq dashboard-center-content t
											dashboard-set-heading-icons t
											dashboard-set-navigator t)))

;;; Org
(package-require
 'org
 :before-load-eval '(progn
											(define-prefix-command 'org-key-map)
											(global-set-key (kbd "C-z C-c") 'org-key-map))
 :keymap '(("C-z C-c g" . org-agenda)
					 ("C-z C-c c" . org-capture)
					 ("C-z C-c s" . org-timer-start)
					 ("C-z C-c S" . org-timer-set-timer)
					 ("C-z C-c e" . org-timer-stop)
					 ("C-z C-c SPC" . org-timer-pause-or-continue)
					 ("C-z C-c C-i" . spring/use-space-indent))
 :delay-eval '(progn
								(setq org-src-fontify-natively t)
								(require 'init-org))
 :hook '(org-mode-hook . (lambda () (setq indent-tabs-mode nil) (define-key org-mode-map (kbd "C-'") nil))))
;;; Child package
(package-require
 'org-bullets
 :hook '(org-mode-hook . (lambda () (org-bullets-mode t)))
 :delay-eval '(setq org-bullets-bullet-list '("" "☯" "❀" "✿")))

;;; Vterm
(package-require
 'vterm
 :keymap '(("C-' C-t" . open-vterm))
 :delay-eval '(progn
								(define-key vterm-mode-map (kbd "C-c p") 'previous-buffer)
								(define-key vterm-mode-map (kbd "C-c n") 'next-buffer)))

;;; Counsel
(package-require
 'counsel
 :keymap '(("M-x" . counsel-M-x)
					 ("C-x C-f" . counsel-find-file)
					 ("C-z a" . counsel-linux-app)))

;;; Icons
(package-require
 'all-the-icons
 :keymap '(("C-' C-i" . all-the-icons-insert)))

;;; ivy
(package-require
 'ivy
 :hook '(after-init-hook . ivy-mode))

;;; Bongo
(package-require 'bongo)

;;; Which Key
(package-require
 'which-key
 :hook '(after-init-hook . which-key-mode))

;;; ace window
(package-require
 'ace-window
 :keymap '(("C-' C-c" . ace-window)))

;;; Calendar-China
(package-require 'cal-china-x)

;;; Iedit
(package-require
 'iedit
 :keymap '(("C-' C-e" . iedit-mode)))

;;; hungry-delete
(package-require
 'hungry-delete
 :keymap '(("C-' C-h" . hungry-delete-mode)
					 ("C-' DEL" . hungry-delete-backward))
 :hook '((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))

;;; js2-mode
(package-require
 'js2-mode
 :hook '(js-mode . js2-mode))

;;; Web-mode
(package-require
 'web-mode
 :delay-eval '(progn
								(setq auto-mode-alist
											(append '(("\\.html\\'" . web-mode)) auto-mode-alist))
								(setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
															web-mode-css-indent-offset 2
															web-mode-code-indent-offset 2) ; Indent of JavaScript in HTML
								))


;;; Auto Completion
;;; Company (Complete Anything)
(package-require
 'company
 :hook '(after-init-hook . global-company-mode)
 :delay-eval '(progn
								(setq company-idle-delay 0
											company-minimum-prefix-length 1)
								(with-eval-after-load
										'company
									(define-key company-active-map (kbd "M-p") nil)
									(define-key company-active-map (kbd "M-n") nil)
									(define-key company-active-map (kbd "C-n") #'company-select-next)
									(define-key company-active-map (kbd "C-p") #'company-select-previous))
								(package-require 'company-lsp)
								(package-require
								 'company-c-headers
								 :delay-eval '(add-to-list 'company-backends 'company-c-headers))))

;;; Lsp-mode
(package-require
 'lsp-mode
 :hook '((c-mode-hook python-mode c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
 :keymap '(("C-' F" . lsp-format-buffer))
 :delay-eval '(progn
								(setq lsp-idle-delay 1200
											lsp-auto-guess-root nil
											lsp-file-watch-threshold 2000
											lsp-eldoc-hook nil
											lsp-prefer-flymake nil)))

;; ccls (For lsp-mode)
;; (package-require
;;  'ccls
;;  :hook '((c-mode-hook c++-mode-hook objc-mode-hook) . (lambda () (lsp))))

;;; emmet-mode
(package-require
 'emmet-mode
 :hook '(web-mode-hook . emmet-mode)
 :delay-eval '(progn (setq emmet-self-closing-tag-style " /")))

;;; Snippet
(package-require
 'yasnippet
 :keymap '(("C-' i" . yas-insert-snippet)
					 ("C-' C-y" . yas-expand-from-trigger-key))
 :hook '(after-init-hook . yas-global-mode)
 :delay-eval '(progn
								(package-require 'yasnippet-snippets)
								(setq yas-snippet-dirs '("~/.emacs.d/snippets"
																				 "~/.emacs.d/elpa/yasnippet-snippets-20200802.1658/snippets"))))

;;;FlyMake
(package-require
 'flymake
 :keymap '(("C-' C-f" . flymake-mode)))

;;; rainbow-delimiters
(package-require
 'rainbow-delimiters
 :hook '((lisp-mode-hook emacs-lisp-mode-hook org-mode-hooke eshell-mode-hook) . rainbow-delimiters-mode))

;;; indent guide
(package-require
 'indent-guide
 :hook '(after-init-hook . indent-guide-global-mode))

;;; doom-modeline
(package-require
 'doom-modeline
 :hook '(after-init-hook . doom-modeline-mode)
 :delay-eval '(progn
								(setq-default doom-modeline-height 13)
								(setq-default doom-modeline-bar-width 3)))

;;; magit
(package-require
 'magit
 :keymap '(("C-' m" . magit-status)))

;;; Window Resize
(package-require
 'windresize
 :keymap '(("C-' C-r" . windresize)))

;;; multiple cursor
(package-require
 'multiple-cursors
 :keymap '(("C-M-l" . mc/edit-lines)
					 ("C->" . mc/mark-next-like-this)
					 ("C-<" . mc/mark-previous-like-this)
					 ("M-m" . newline)))

;;; youdao translate
(package-require
 'youdao-dictionary
 :keymap '(("C-' t" . youdao-dictionary-search-at-point)))

;;; Treemacs : File explore
(package-require
 'treemacs
 :keymap '(("C-' e" . treemacs)))

;;; Dap-mode
(package-require
 'dap-mode
 :keymap '(("C-' d" . dap-debug)
					 ("<F5>" . dap-breakpoint-toggle)
					 ("<F6>" . dap-continue)))

;;; avy-mode
(package-require
 'avy
 :keymap '(("C-' a c" . avy-goto-char)
					 ("C-' a C" . avy-goto-char-2)
					 ("C-' a l" . avy-goto-line)
					 ("C-' a w" . avy-goto-word-1)
					 ("C-' a W" . avy-goto-word-0)
					 ("C-' a r" . avy-resume)))

;;; Caps_Lock
(package-require
 'caps-lock
 :keymap '(("C-' g" . caps-lock-mode)))

;;; isolate-mode
(package-require
 'isolate
 :keymap '(("C-' C-a s" . isolate-quick-add)
					 ("C-' C-a S" . isolate-long-add)
					 ("C-' C-a d" . isolate-quick-delete)
					 ("C-' C-a D" . isolate-long-delete)
					 ("C-' C-a c" . isolate-quick-change)
					 ("C-' C-a C" . isolate-long-change)))

;;; paredit mode
(package-require
 'paredit
 :hook '((lisp-mode-hook emacs-lisp-mode-hook eshell-mode-hook lisp-interaction-mode-hook) . paredit-mode)
 :keymap '(("C-' f" . paredit-focus-on-defun)))

;;; QuickRun
(package-require
 'quickrun
 :keymap '(("C-' r" . quickrun-shell)))

(provide 'init-package)
