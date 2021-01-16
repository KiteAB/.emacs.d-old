;;; init.el --- Require features

;; Filename: init.el
;; Description: Require features
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2020-12-10 21:43:50
;; Last-Updated: 2021-01-16 12:31:15
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init.el
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
;; Require features
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Code:

;; Preparation
(require 'init-accelerate)
(require 'init-font)

(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))

  (defvar kiteab-emacs-root-dir (file-truename "~/kiteab-emacs"))
  (defvar kiteab-emacs-site-lisp-dir (file-truename (concat kiteab-emacs-root-dir "/site-lisp")))
  (defvar kiteab-emacs-config-dir (concat kiteab-emacs-site-lisp-dir "/config"))
  (defvar kiteab-emacs-extension-dir (concat kiteab-emacs-site-lisp-dir "/extensions"))

  (with-temp-message ""
    (require 'init-generic)
    (require 'init-package)
    (require 'init-time)
    (require 'init-modes)
    (require 'init-function)
    (require 'init-ui)

    (require 'lazycat-theme)
    ;; (lazycat-theme-load-dark)
    (require 'joker-theme)
    (require 'storybook-theme)
    (require 'printed-theme)
    (load-theme 'joker t)

    (require 'init-key)
    ;; (require 'init-xfk)
    (require 'init-meow)

    (require 'basic-toolkit)
    (require 'lazy-load)
    (require 'init-performance)
    ;; (require 'init-awesome-tray)
    (require 'awesome-tray)
    (require 'init-modeline)


    (require 'init-scratch)

    (run-with-idle-timer
     0.5 nil
     #'(lambda ()
         (require 'init-ace-jump)
         (require 'init-ace-window)
         (require 'init-aggressive-indent)
         (require 'init-auto-save)
         (require 'init-multiple-cursors)
         (require 'init-auto-sudoedit)
         (require 'init-nerd-commenter)
         (require 'init-pacarch)
         (require 'init-clm)
         ;; (require 'init-paren-face)
         (require 'init-comment)
         (require 'init-company-eh)
         (require 'init-counsel)
         (require 'init-dired)
         (require 'init-disable-mouse)
         (require 'init-eaf)
         (require 'init-flycheck)
         (require 'init-git)
         (require 'init-indent-guide)
         (require 'init-info-colors)
         (require 'init-insert-translated-name)
         (require 'init-isearch)
         (require 'init-ivy)
         (require 'init-swiper)
         (require 'init-license-templates)
         (require 'init-popwin)
         (require 'init-rainbow-mode)
         (require 'init-recentf)
         (require 'init-smooth-scrolling)
         (require 'init-which-key)
         (require 'init-whitespace)
         (require 'init-windresize)
         (require 'init-yasnippet)
         (require 'init-youdao-dict)
         (require-pkg 'undo-tree)
         (global-undo-tree-mode 1)

         (require 'init-org)
         (require 'init-valign)

         ;; (require 'init-awesome-pair)
         (require 'init-lispy)
         (require 'init-symbol-overlay)
         ;; (require 'init-highlight-defined)
         (require 'init-highlight-quoted)

         (require 'init-company-mode)
         (require 'init-lsp)
         (require 'init-nox)
         (require 'init-elpy)

         (require 'init-projectile)
         ;; (require 'init-treemacs)

         (require 'init-cc)
         (require 'init-golang)
         (require 'init-python)

         (require 'init-web-mode)
         (require 'init-yaml-mode)
         (install-pkg 'omnisharp)

         (require 'init-session)
         (emacs-session-restore)

         (server-start)
         ))))

(provide 'init)

;;; init.el ends here
