;;; init-meow.el --- Settings for meow

;; Filename: init-meow.el
;; Description: Settings for meow
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2021-01-06 17:17:02
;; Last-Updated: 2021-01-06 17:18:17
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-meow.el
;; Keywords:
;;
;; Features that might be required by this library:
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

;;; Commentary:
;;
;; Settings for meow
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
(require-pkg 'meow)

;;; Code:

;; (meow-global-mode 1)

;; Motions
(defun kiteab/meow-forward-char ()
  (interactive)
  (when (< (point) (line-end-position))
    (forward-char (abs (prefix-numeric-value nil)))))

(defun kiteab/meow-backward-char ()
  (interactive)
  (when (> (point) (line-beginning-position))
    (backward-char (abs (prefix-numeric-value nil)))))

(defun kiteab/meow-forward-char-and-insert ()
  (interactive)
  (kiteab/meow-forward-char)
  (meow-insert))

(defun kiteab/meow-insert-at-end ()
  (interactive)
  (end-of-line)
  (meow-insert))

(defun kiteab/meow-down-5-lines ()
  (interactive)
  (next-line 5))

(defun kiteab/meow-insert-at-beginning ()
  (interactive)
  (beginning-of-line)
  (meow-insert))

(defun kiteab/meow-backward-char-and-normal ()
  (interactive)
  (kiteab/meow-backward-char)
  (meow-normal-mode 1))

;; Main Function
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak)
  (define-key meow-insert-state-keymap (kbd "<escape>") #'kiteab/meow-backward-char-and-normal)

  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))

  (meow-normal-define-key
   '("1" . meow-expand-1)
   '("2" . meow-expand-2)
   '("3" . meow-expand-3)
   '("4" . meow-expand-4)
   '("5" . meow-expand-5)
   '("6" . meow-expand-6)
   '("7" . meow-expand-7)
   '("8" . meow-expand-8)
   '("9" . meow-expand-9)
   '("0" . meow-expand-0)
   '("-" . negative-argument)
   '(";" . counsel-M-x)
   '("?" . help-command)
   '("<escape>" . meow-last-buffer)
   '("a" . kiteab/meow-forward-char-and-insert)
   '("A" . kiteab/meow-insert-at-end)
   '("b" . backward-word)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-delete)
   '("e" . next-line)
   '("E" . kiteab/meow-down-5-lines)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-keyboard-quit)
   '("G" . goto-line)
   '("i" . kiteab/meow-forward-char)
   '("I" . end-of-line)
   '("k" . meow-insert)
   '("K" . kiteab/meow-insert-at-beginning)
   '("l" . undo-only)
   '("L" . undo-tree-visualize)))

(setq meow-esc-delay 0.001)

;; (meow-setup)

(provide 'init-meow)

;;; init-meow.el ends here
