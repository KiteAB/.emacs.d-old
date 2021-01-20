;;; init-ui.el --- Settings for user interface  -*- lexical-binding: t -*-

;; Filename: init-ui.el
;; Description: Settings for user interface
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-18 20:44:12
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-ui.el
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
;; Settings for user interface
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

;; Basics
(menu-bar-mode -1) ; Close the menu bar
(tool-bar-mode -1) ; Close the tool bar
(scroll-bar-mode -1) ; Close Scroll bar
(tab-bar-mode -1) ; Set tab bar not display
(global-hl-line-mode t) ; Highlight current line
(setq tab-bar-show nil) ; Always not display tab bar

;; Relative Line Numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(toggle-frame-fullscreen) ; Set fullscreen
(setq inhibit-splash-screen t) ; Close the startup screen

;; Transparent Background
(set-frame-parameter nil 'alpha '(90 . 100))

(provide 'init-ui)

;;; init-ui.el ends here
