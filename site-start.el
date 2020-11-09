;;; .emacs.d ---  My Personal Emacs Configuration File

;; Author: KiteAB <kiteabpl@outlook.com>
;; Maintainer: KiteAB <kiteabpl@outlook.com>
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Last-Updated: 2020-11-09 17:46:12
;;           By: KiteAB
;; URL: http://github.com/KiteAB/.emacs.d
;; Keywords:
;; Compatibility: GNU Emacs 27.1
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

;;; TODO
;;
;;
;;

(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/site-lisp/config")

(require 'init)
