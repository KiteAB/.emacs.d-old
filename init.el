;;;;; KiteAB's Personal Emacs Configuration File
;;;; Mirror
(require 'package)
(require 'cl-lib) ; Common Lisp
(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
												 ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;;; Init use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/third-party/use-package")
  (require 'use-package))
(setq use-package-hook-name-suffix nil) ;; Make use-package's ":hook" keyword don't run macro to add "-hook" in the hoobk name, default value is "-hook"

;;;; Variables
(defvar kiteab/time-block nil
	"If the the time-block changed, it is t.
Otherwise it's nil.")

;;;; Other config files
;; Error Capture
(load-file "~/.emacs.d/init-error-manager.el")
(require 'init-error-manager)
;; Macros
(load-file "~/.emacs.d/macros.el")
;;; GitHub
(when (kiteab/error-check '("~/.emacs.d/init.el::17" "init.el") :file-exists "~/.emacs.d/token.el")
	(load-file "~/.emacs.d/token.el")
	(require 'github-token))
;;; The cache directory
(setq user-emacs-directory "~/.emacs.d/var")
;;; Other files
(add-to-list 'load-path "~/.emacs.d/etc/")
;; UI
(require 'init-ui)
;; Packages
(require 'init-require-package)
;; The functions
(require 'init-functions)
;; Keymaps
(require 'init-keymaps)
;; Other mode settings
(require 'init-modes)


;;;; Basic things
;;; Functions
(fset 'yes-or-no-p 'y-or-n-p) ; Change the asking's answer way
(delete-selection-mode t) ; Delete the seleceted text
(show-paren-mode t) ; Highlight the ()
(electric-pair-mode t) ; Auto complete the ()
(setq electric-pair-pairs
			'((?\" . ?\")
				(?\( . ?\))
				(?\< . ?\>)
				(?\{ . ?\}))) ; Set the electric-pair-mode's pair keywords
(setq make-backup-files nil ; Don't let Emacs make up backup file
      create-lockfiles nil ;Don't make lockfile
      auto-save-default nil ; Don't auto save the file
      )
(setq initial-scratch-message
			";; KiteAB's Emacs
;; This is the temp buffer named *scratch*
;; You can test the Emacs Lisp in it

")
(setq-default tab-width 2) ; The tab width
(setq-default indent-tabs-mode t) ; Use tab indent
(setq-default css-indent-offset 2) ; Set css indent width
(setq display-time-24hr-format t) ; Display the time and date on modeline
(display-time-mode t) ; Display the time
(column-number-mode t) ; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ; Delete the tab by once
(setq user-init-file "~/.emacs.d/var/user-init.el")
(add-hook 'markdown-mode-hook #'markdown-table-keymap) ; Add the markdown table align keymap
(add-hook 'erc-mode-hook #'(lambda () (linum-mode -1)))

;;;; Plugin requires
(require 'init-package)
(package-initialize)

;;;; Enable Disbaled command
(require 'novice)
(load-file "~/.emacs.d/init-enable-disabled-commands.el")
(require 'init-enable-disabled-commands)
(enable-commands-init)

;;;; Autostart
;;; Erc
;(kiteab/open-erc) ; Auto open erc
;(switch-to-buffer "*dashboard*") ; Hide erc at backstage
