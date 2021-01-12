;;; init-font.el --- Settings for fonts

;; Filename: init-font.el
;; Description: Settings for fonts
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-18 20:00:00
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-font.el
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
;; Settings for fonts
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

(setq kiteab/en-font-name "Fira Code Nerd Font Mono"
      kiteab/en-font-style "Regular"
      kiteab/en-font-size 20)

(setq kiteab/zh-font-name "WenQuanYi MicroHei Mono"
      kiteab/zh-font-style "Regular"
      kiteab/zh-font-size 24)

;; The Quick Brown Fox Jumps Over The Lazy Dog
;; 中英文等宽字体测试 - 敏捷的棕色狐狸跳过懒狗

(progn
  (if (fontp (font-spec
              :name kiteab/en-font-name
              :style kiteab/en-font-style
              :size kiteab/en-font-size))
      (progn
        (set-face-attribute 'default nil
                            :font (font-spec
                                   :name kiteab/en-font-name
                                   :style kiteab/en-font-style
                                   :size kiteab/en-font-size))
        (set-fontset-font t 'han (font-spec
                                  :name kiteab/zh-font-name
                                  :style kiteab/zh-font-style
                                  :size kiteab/zh-font-size))
        (set-fontset-font t ?中 (font-spec
                                 :name kiteab/zh-font-name
                                 :style kiteab/zh-font-style
                                 :size kiteab/zh-font-size))
        (set-fontset-font "fontset-default" ?༼ (font-spec
                                                :name "Noto Serif Tibetan"
                                                :size 0)))
    (message "Can't find %s font. You can install it or ignore this message at init-font.el" kiteab/en-font-name)))
(provide 'init-font)

;;; init-font.el ends here
