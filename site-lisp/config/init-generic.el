;;; init-generic.el --- Basic settings

;; Filename: init-generic.el
;; Description: Basic settings
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:50:51
;; Last-Updated: 2020-12-18 20:05:03
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-generic.el
;; Keywords:
;;
;; Feature that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary
;;
;; Basic settings
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require

;;; Code:

;; Functions
(fset #'yes-or-no-p #'y-or-n-p) ;; Change the asking's answer way
;; (add-hook 'after-change-major-mode-hook (lambda ()
;;                                          (modify-syntax-entry ?_ "w")))
;; (add-hook 'after-change-major-mode-hook (lambda ()
;;                                           (modify-syntax-entry ?- "w")))
(delete-selection-mode t) ;; Delete the seleceted text
(show-paren-mode t)       ;; Highlight the "()"
(electric-pair-mode t)    ;; Auto complete the "()"

;; UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8) ;; pretty
(set-terminal-coding-system  'utf-8) ;; pretty
(set-keyboard-coding-system  'utf-8) ;; pretty
(set-selection-coding-system 'utf-8) ;; please
(prefer-coding-system        'utf-8) ;; with sugar on top
(setq default-process-coding-system '(utf-8 . utf-8))

(setq electric-pair-pairs
      '((?\" . ?\")
        (?\( . ?\))
        (?\< . ?\>)
        (?\{ . ?\}))) ;; Set the electric-pair-mode's pair keywords

(setq-default tab-width 2) ;; The tab width
(setq-default indent-tabs-mode nil) ;; Use space indent
(setq-default css-indent-offset 2) ;; Set css indent width
(setq eshell-history-file-name "~/.emacs/var/eshell/history")
;; (column-number-mode t) ;; Show the column number in the modeline
(setq backward-delete-char-untabify-method nil) ;; Delete the tab by once
(setq user-emacs-directory "~/.emacs.d/var") ;; The Cache Directory
(setq user-init-file "~/.emacs.d/var/user-init.el")
(setq load-prefer-newer t)
(save-place-mode t) ;; Save the point position
(setq ring-bell-function 'ignore
      blink-cursor-mode nil) ;; Disable Infos
(setq inhibit-compacting-font-caches t) ;; Enable font cache
(global-auto-revert-mode t)
(setq load-prefer-newer t)
(setq mouse-yank-at-point nil)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(provide 'init-generic)

;;; init-generic.el ends here
