;;  __  __         _____
;; |  \/  |_   _  | ____|_ __ ___   __ _  ___ ___
;; | |\/| | | | | |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |  | | |_| | | |___| | | | | | (_| | (__\__ \
;; |_|  |_|\__, | |_____|_| |_| |_|\__,_|\___|___/
;;         |___/

;; Author: KiteAB (https://github.com/KiteAB)
;; Repository: https://github.com/KiteAB/.emacs.d

;;; Benchmark
;(load-file "~/.emacs.d/benchmark.el")

;;; Auto opzimization
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq inhibit-compacting-font-caches nil)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda ()
														 (setq gc-cons-threshold gc-cons-threshold-original)
                             (setq file-name-handler-alist file-name-handler-alist-original)
                             (makunbound 'gc-cons-threshold-original)
                             (makunbound 'file-name-handler-alist-original)))

;;;; Config Files
(add-to-list 'load-path "~/.emacs.d/etc/settings")
(add-to-list 'load-path "~/.emacs.d/etc/languages")
(add-to-list 'load-path "~/.emacs.d/etc/tools")

;;; The cache directory
(setq user-emacs-directory "~/.emacs.d/var")

;;; Other Settings
;;; User Interface
(require 'init-ui)
;;; Functions
(require 'init-functions)
;;; Keymaps
(require 'init-keymaps)
;;; Other mode settings
(require 'init-modes)
;;; Macros
(require 'init-macros)
;;; Plugin requires
(package-initialize)
(require 'init-packages)
;;; GitHub (Markdown Preview)
(load-file "~/.emacs.d/token.el")
(require 'gh-token)

;;; Basic Things
(require 'init-basic)

;;; Enable Disbaled command
(require 'novice)
(require 'init-enable-disabled-commands)
(enable-commands-init)

;;; Languages settings
(require 'kiteab-python)
(require 'kiteab-c)
