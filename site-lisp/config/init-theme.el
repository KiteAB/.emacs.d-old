;;; init-theme.el --- Settings for themes  -*- lexical-binding: t -*-

;; Filename: init-theme.el
;; Description: Settings for themes
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2021-02-02 23:10:24
;; Last-Updated: 2021-02-23 13:19:15
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-theme.el
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
;; Settings for themes
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
(require-pkg 'circadian)
(require-pkg 'nord-theme)
;; (require 'lazycat-theme)
(require 'joker-theme)
(require 'storybook-theme)
;; (require 'printed-theme)

;;; Code:

;; Joker Theme

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-window-fringes
             (minibuffer-window frame) 0 0 nil t)))

(setq joker-theme-main-color "#00AAAA")

;; Circadian
(setq calendar-latitude  27.82681
      calendar-longitude 113.08231)
(setq circadian-themes
      '((:sunrise . nord)
        (:sunset  . joker)))
(circadian-setup)

(provide 'init-theme)

;;; init-theme.el ends here
