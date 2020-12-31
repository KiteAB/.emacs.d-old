;;; KiteAB Emacs - A Simple and Fast Emacs Configuration

;; Description: A Simple and Fast Emacs Configuration
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2020-08-30 18:40:22
;;      By: KiteAB
;; URL: http://github.com/KiteAB/.emacs.d
;; Keywords:
;; Compatibility: GNU Emacs 27.1

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
;; A Simple and Fast Emacs Configuration
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

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/kiteab-emacs/site-lisp/config/")
(add-subdirs-to-load-path "~/kiteab-emacs/site-lisp/extensions/")

(require 'init)

;;; site-start.el ends here
