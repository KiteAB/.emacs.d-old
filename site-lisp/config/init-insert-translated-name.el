;;; init-insert-translated-name.el --- Settings for insert translated name  -*- lexical-binding: t -*-

;; Filename: init-insert-translated-name.el
;; Description: Settings for insert translated name
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-20 15:18:05
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-insert-translated-name.el
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
;; Settings for insert translated name
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

(lazy-load-global-keys
 '(("C-' C-l i" . insert-translated-name-insert)
   ("C-' C-l u" . insert-translated-name-insert-with-underline)
   ("C-' C-l c" . insert-translated-name-insert-with-camel)
   ("C-' C-l l" . insert-translated-name-insert-with-line)
   ("C-' C-l o" . insert-translated-name-insert-original-translation)
   ("C-' C-l r" . insert-translated-name-replace)
   ("C-' C-l U" . insert-translated-name-replace-with-underline)
   ("C-' C-l C" . insert-translated-name-replace-with-camel)
   ("C-' C-l L" . insert-translated-name-replace-with-line))
 "insert-translated-name")

(provide 'init-insert-translated-name)

;;; init-insert-translated-name.el ends here
