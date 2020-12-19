;;; init-eaf.el --- Settings for emacs application framework

;; Filename: init-eaf.el
;; Description: Settings for emacs application framework
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-19 16:46:17
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-eaf.el
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
;; Settings for emacs application framework
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
(require 'eaf)

;;; Code:

(lazy-load-global-keys
 '(("C-q C-b o" . eaf-open-browser))
 "eaf")

(setq eaf-grip-token "c9a51aa390cd3bce36a7d307d404d2aeb030f707")
(setq eaf-browser-default-search-engine "Bing")
(setq eaf-browser-search-engines '(("Baidu" . "https://www.baidu.com/s?wd=%s")
                                   ("Bing" . "https://cn.bing.com/search?q=%s")))

(eaf-setq eaf-browser-remember-history "true")
(eaf-setq eaf-browser-default-zoom "1.5")
(eaf-setq eaf-terminal-font-family "WenQuanYi Micro Hei")
(eaf-setq eaf-browser-dark-mode "false")

(provide 'init-eaf)

;;; init-eaf.el ends here
