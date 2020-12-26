;;; init-xfk.el --- Settings for xah fly keys

;; Filename: init-xfk.el
;; Description: Settings for xah fly keys
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-12 21:29:53
;; Last-Updated: 2020-12-18 22:38:32
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-xfk.el
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
;; Settings for xah fly keys
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
(require-pkg 'xah-fly-keys)

;;; Code:

(xah-fly-keys 1)

(xah-fly-keys-set-layout "colemak")

(defun xfk-define-in-all-modes (key def)
  (define-key xah-fly-command-map (kbd key) def)
  (define-key xah-fly-insert-map  (kbd key) def))

(defun xfk-define-command-key (key func)
  (define-key xah-fly-command-map (kbd key) func))

(defun xfk-define-insert-key (key func)
  (define-key xah-fly-insert-map (kbd key) func))

(defun xfk-define-prefix-key (prefix key)
  (define-prefix-command prefix)
  (xfk-define-command-key (kbd key) prefix))

(defun xfk-define-prefix-key-with-leader (prefix key)
  (define-prefix-command prefix)
  (xfk-define-command-key (kbd (concat "SPC " key)) prefix))

(defun xfk-define-leader-key (key func)
  (define-key xah-fly-command-map (kbd (concat "SPC " key)) func))

;; Motions
(defun xfk-up-5-lines ()
  (interactive)
  (previous-line 5))

(defun xfk-down-5-lines ()
  (interactive)
  (next-line 5))

(defun xfk-insert-at-beginning ()
  (interactive)
  (beginning-of-line)
  (xah-fly-insert-mode-activate))

(defun xfk-insert-at-end ()
  (interactive)
  (end-of-line)
  (xah-fly-insert-mode-activate))

(defun xfk-forward-char ()
  (interactive)
  (when (< (point) (line-end-position))
    (forward-char (abs (prefix-numeric-value nil)))))

(defun xfk-backward-char ()
  (interactive)
  (when (> (point) (line-beginning-position))
    (backward-char (abs (prefix-numeric-value nil)))))

(defun xfk-forward-char-and-insert ()
  (interactive)
  (xfk-forward-char)
  (xah-fly-insert-mode-activate))

(defun xfk-backward-char-and-command ()
  (interactive)
  (xfk-backward-char)
  (xah-fly-command-mode-activate))

(defun xfk-newline-below-and-insert ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (xah-fly-insert-mode-activate)
  (indent-for-tab-command))

(defun xfk-newline-top-and-insert ()
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (xah-fly-insert-mode-activate)
  (indent-for-tab-command))

(defun xfk-next-word ()
  (interactive)
  (right-word)
  (forward-char))

(defun xfk-kill-region-and-insert ()
  (interactive)
  (kill-region)
  (xah-fly-insert-mode-activate))

;; Basics
(xfk-define-in-all-modes "<f11>" #'toggle-frame-fullscreen)
(xfk-define-in-all-modes "C-n"   #'next-line)
(xfk-define-in-all-modes "C-a"   #'beginning-of-line)

(xfk-define-insert-key  "<escape>" #'xfk-backward-char-and-command)
(xfk-define-command-key "<escape>" #'mode-line-other-buffer)

(xfk-define-command-key  "t"     nil)
(xfk-define-command-key  "j"     nil)
(xfk-define-in-all-modes "C-s"   nil)
(xfk-define-in-all-modes "C-w"   nil)
(xfk-define-command-key  "M-SPC" nil)

(xfk-define-command-key "n" #'xfk-backward-char)
(xfk-define-command-key "i" #'xfk-forward-char)

(xfk-define-command-key "N"   #'beginning-of-line)
(xfk-define-command-key "I"   #'end-of-line)
(xfk-define-command-key "k"   #'xah-fly-insert-mode-activate)
(xfk-define-command-key "S"   #'save-buffer)
(xfk-define-command-key "Q"   #'kill-current-buffer)
(xfk-define-command-key "U"   #'xfk-up-5-lines)
(xfk-define-command-key "E"   #'xfk-down-5-lines)
(xfk-define-command-key "K"   #'xfk-insert-at-beginning)
(xfk-define-command-key "A"   #'xfk-insert-at-end)
(xfk-define-command-key "a"   #'xfk-forward-char-and-insert)
(xfk-define-command-key "v"   #'set-mark-command)
(xfk-define-command-key "x"   #'delete-char)
(xfk-define-command-key "l"   #'undo-only)
(xfk-define-command-key "/"   #'swiper)
(xfk-define-command-key ";"   #'counsel-M-x)
(xfk-define-command-key ":"   #'counsel-M-x)
(xfk-define-command-key "`"   #'xah-toggle-letter-case)
(xfk-define-command-key "DEL" #'backward-char)

(xfk-define-command-key "h" 'help-command)

;; With prefix
;; Beginning/End of buffer
(xfk-define-prefix-key 'xfk-g-command "g")
(xfk-define-command-key "gg" #'beginning-of-buffer)
(xfk-define-command-key "G"  #'end-of-buffer)

(xfk-define-command-key "gf" #'xref-find-definitions)

;; New line
(xfk-define-command-key "o" #'xfk-newline-below-and-insert)
(xfk-define-command-key "O" #'xfk-newline-top-and-insert)

;; Cut/Copy/Paste
(xfk-define-command-key "p" #'yank)
(xfk-define-command-key "y" #'kill-ring-save)
(xfk-define-command-key "d" #'kill-region)
(xfk-define-command-key "c" #'xfk-kill-region-and-insert)

;; Word move
(xfk-define-command-key "w" #'xfk-next-word)
(xfk-define-command-key "b" #'backward-word)

;; Comment
(xfk-define-insert-key ";" #'lispy-comment)

;; With leader key
;; Built-in function keys
;; File
(xfk-define-prefix-key-with-leader 'xfk-leader-f-command "f")
(xfk-define-leader-key "ff" #'find-file)

;; Buffer
(xfk-define-prefix-key 'xfk-leader-t-command "t")

;; Window
(xfk-define-command-key "1"   #'delete-other-windows)
(xfk-define-command-key "2"   #'split-window-below)
(xfk-define-command-key "3"   #'split-window-right)
(xfk-define-command-key "0"   #'delete-window)
(xfk-define-command-key "C-o" #'other-window)

;; Useful
(xfk-define-prefix-key-with-leader 'xfk-leader-z-command "z")
(xfk-define-leader-key "zf" #'mark-defun)
(xfk-define-leader-key "zl" #'undo)
(xfk-define-leader-key "zr" #'query-replace)
(xfk-define-leader-key "ze" #'eshell)
(xfk-define-leader-key "zp" #'list-processes)
(xfk-define-leader-key "zg" #'goto-line)
(xfk-define-leader-key "za" #'align-regexp)

;; Save session and quit emacs
(xfk-define-leader-key "Q" #'emacs-session-save)

;; init-functions.el
(xfk-define-prefix-key-with-leader 'xfk-leader-q-command "q")
(xfk-define-command-key "SPC q" 'xfk-leader-q-command)
(xfk-define-leader-key "qc"    #'open-config-folder)
(xfk-define-leader-key "qC"    #'open-require-file)
(xfk-define-leader-key "qa"    #'set-alpha)
(xfk-define-leader-key "qs"    #'kiteab/open-scratch)
(xfk-define-leader-key "qT"    #'kiteab/add-todo-in-code)
(xfk-define-leader-key "qi"    #'kiteab/change-indent-type)
(xfk-define-leader-key "qp"    #'kiteab/provide-feature-name)
(xfk-define-leader-key "qt"    #'kiteab/insert-current-date-time)
(xfk-define-leader-key "qu"    #'kiteab/upgrade-modules)
(xfk-define-leader-key "q TAB" #'kiteab/open-erc)
(xfk-define-leader-key "q SPC" #'kiteab/format-commit)

;; Package keys
;; Magit
(xfk-define-leader-key "m" #'magit)

;; Evil Nerd Commenter
(xfk-define-leader-key "c" #'evilnc-comment-or-uncomment-lines)

(provide 'init-xfk)

;;; init-xfk.el ends here
