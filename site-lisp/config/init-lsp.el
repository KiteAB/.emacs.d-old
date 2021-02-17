;;; init-lsp.el --- Settings for lsp  -*- lexical-binding: t -*-

;; Filename: init-lsp.el
;; Description: Settings for lsp
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2021-02-17 21:28:32
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-lsp.el
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
;; Settings for lsp
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

(install-pkg 'lsp-mode)
(dolist (hook (list
               'c-mode-hook
               'c++-mode-hook
               'lisp-mode-hook
               'js-mode-hook
               'web-mode-hook
               'go-mode-hook
               ))
  (add-hook hook '(lambda ()
                    ;; (require 'lsp-mode)
                    ;; (lsp)
                    (require 'nox)
                    (nox-ensure)
                    )))

(install-pkg 'lsp-pyright)
(add-hook 'python-mode-hook #'(lambda ()
                                (require 'lsp-pyright)
                                ;; (lsp)
                                (nox-ensure)))

(provide 'init-lsp)

;;; init-lsp.el ends here
