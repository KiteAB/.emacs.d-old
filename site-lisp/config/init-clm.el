;;; init-clm.el --- Settings for command log mode

;; Filename: init-clm.el
;; Description: Settings for command log mode
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-19 13:33:32
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-clm.el
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
;; Settings for command log mode
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

(install-pkg 'command-log-mode)

(defun kiteab/toggle-clm ()
  (interactive)
  (global-command-log-mode)
  (clm/toggle-command-log-buffer))

(lazy-load-global-keys
 '(("C-' k" . kiteab/toggle-clm)
   ("C-' K" . clm/command-log-clear))
 "command-log-mode")

(provide 'init-clm)

;;; init-clm.el ends here
