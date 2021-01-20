;;; init-modeline.el --- Settings for modeline

;; Filename: init-modeline.el
;; Description: Settings for modeline
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2021, KiteAB, all rights reserved.
;; Created: 2021-01-16 10:03:48
;; Last-Updated: 2021-01-19 19:57:43
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-modeline.el
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
;; Settings for modeline
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

(defun +simple-mode-line-render (left right)
  "Return a string of `window-width' length.
Containing `left', and `right' aligned respectively."
  (let ((available-width
         (- (window-total-width)
            (+ (length (format-mode-line left))
               (length (format-mode-line right)))
            1)))
    (append left
            (list (format (format "%%%ds" available-width) ""))
            right)))

(defun +modeline-buffer-read-only ()
  (if (and buffer-read-only
           (not (eq buffer-file-name nil)))
      (concat "R-O ")
    ""))

(defface +modeline-buffer-read-only-face
  '((((background light))
     :foreground "#cc2444" :bold t)
    (t
     :foreground "#ff2d55" :bold t))
  "Buffer read only face.")

(defface +modeline-git-info-face
  '((((background light))
     :foreground "#cc2444")
    (t
     :foreground "#ff2d55"))
  "Git face.")

(defface +modeline-buffer-name-face
  '((((background light))
     :foreground "#cc7700")
    (t
     :foreground "#ff9500"))
  "Buffer name face.")

(defface +modeline-dim-face
  '((((class color) (background dark))
     (:foreground "grey40"))
    (((class color) (background light))
     (:foreground "grey60")))
  "Dim face in mode-line")

(setq-default mode-line-format
              ;; basic quote
              '(
                ;; eval +simple-mode-line-render
                (:eval
                 (+simple-mode-line-render
                  ;; left side
                  '(
                    (:eval (meow-indicator))
                    " %l:%C "
                    (:propertize (-3 "%p") face +modeline-dim-face)
                    (:eval (propertize " " 'display '(height 1.1)))
                    )

                  ;; right side
                  '(
                    (:propertize mode-name face font-lock-keyword-face)
                    (:propertize " %b " face +modeline-buffer-name-face)
                    (:eval (propertize (+modeline-buffer-read-only) 'face '+modeline-buffer-read-only-face))
                    (:eval (propertize (awesome-tray-module-git-info) 'face '+modeline-git-info-face))
                    " "
                    (:eval (propertize (format-time-string "%m-%d %H:%M %a") 'face '+modeline-dim-face))
                    " ")
                  ;; +simple-mode-line-render ends here
                  )
                 )))

(provide 'init-modeline)

;;; init-modeline.el ends here
