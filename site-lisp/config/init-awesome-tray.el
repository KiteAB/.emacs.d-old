;;; init-awesome-tray.el --- Settings for awesome tray  -*- lexical-binding: t -*-

;; Filename: init-awesome-tray.el
;; Description: Settings for awesome tray
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-18 20:24:18
;; Last-Updated: 2020-12-18 19:55:59
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-awesome-tray.el
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
;; Settings for awesome tray
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
(require 'awesome-tray)

;;; Code:

(awesome-tray-mode 1)

(setq awesome-tray-refresh-idle-delay 0.001)

;; Modules
;; (defun awesome-tray-module-emacs-info ()
;;   (concat "KiteAB Emacs"))
;; (add-to-list 'awesome-tray-module-alist '("emacs" . (awesome-tray-module-emacs-info awesome-tray-module-battery-face)))

(defun awesome-tray-module-meow-info ()
  (meow-indicator))
(add-to-list 'awesome-tray-module-alist '("meow" . (awesome-tray-module-meow-info)))

(setq awesome-tray-active-modules '("git"
                                    "location"
                                    "mode-name"
                                    "parent-dir"
                                    "buffer-name"
                                    "buffer-read-only"
                                    "date"
                                    "meow"
                                    ;; "emacs"
                                    ))

(provide 'init-awesome-tray)

;;; init-awesome-tray.el ends here
