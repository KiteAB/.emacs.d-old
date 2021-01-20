;;; init-modes.el --- Settings for other special modes  -*- lexical-binding: t -*-

;; Filename: init-modes.el
;; Description: Settings for other special modes
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-18 20:10:57
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-modes.el
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
;; Settings for other special modes
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

;; Hooks
(add-hook 'markdown-mode-hook   'markdown-table-keymap)
(add-hook 'erc-mode-hook        '(lambda () (display-line-numbers-mode -1)))
(add-hook 'emacs-lisp-mode-hook '(lambda () (outline-minor-mode 1) (prettify-symbols-mode 1)))
(add-hook 'web-mode-hook        '(lambda () (outline-minor-mode 1)))

;; Abbrev Mode
;; (abbrev-mode 1)
;; (define-abbrev-table
;;   'global-abbrev-table
;;   '(("myname"  "KiteAB")
;;     ("myemail" "<kiteabpl@outlook.com>")
;;     ("myblog"  "(https://kiteab.ga)")
;;     ("copyr"   "Copyright (C) <+++> KiteAB")))

(provide 'init-modes)

;;; init-modes.el ends here
