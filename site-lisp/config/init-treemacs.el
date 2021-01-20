;;; init-treemacs.el --- Settings for treemacs  -*- lexical-binding: t -*-

;; Filename: init-treemacs.el
;; Description: Settings for treemacs
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-21 19:17:21
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-treemacs.el
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
;; Settings for treemacs
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

(require-pkg 'treemacs)
(setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
      treemacs-deferred-git-apply-delay      0.5
      treemacs-directory-name-transformer    'identity
      treemacs-display-in-side-window        t
      treemacs-eldoc-display                 t
      treemacs-file-event-delay              5000
      treemacs-file-extension-regex          treemacs-last-period-regex-value
      treemacs-file-follow-delay             0.2
      treemacs-file-name-transformer         'identity
      treemacs-follow-after-init             t
      treemacs-git-command-pipe              ""
      treemacs-goto-tag-strategy             'refetch-index
      treemacs-indentation                   2
      treemacs-indentation-string            " "
      treemacs-is-never-other-window         nil
      treemacs-max-git-entries               5000
      treemacs-missing-project-action        'ask
      treemacs-move-forward-on-expand        nil
      treemacs-no-png-images                 nil
      treemacs-no-delete-other-windows       t
      treemacs-project-follow-cleanup        nil
      treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
      treemacs-position                      'left
      treemacs-recenter-distance             0.1
      treemacs-recenter-after-file-follow    nil
      treemacs-recenter-after-tag-follow     nil
      treemacs-recenter-after-project-jump   'always
      treemacs-recenter-after-project-expand 'on-distance
      treemacs-show-cursor                   nil
      treemacs-show-hidden-files             t
      treemacs-silent-filewatch              nil
      treemacs-silent-refresh                nil
      treemacs-sorting                       'alphabetic-asc
      treemacs-space-between-root-nodes      t
      treemacs-tag-follow-cleanup            t
      treemacs-tag-follow-delay              1.5
      treemacs-user-mode-line-format         nil
      treemacs-user-header-line-format       nil
      treemacs-width                         30)

;; The default width and height of the icons is 22 pixels. If you are
;; using a Hi-DPI display, uncomment this to double the icon size.
;;(treemacs-resize-icons 44)

(treemacs-follow-mode t)
(treemacs-filewatch-mode t)
(treemacs-fringe-indicator-mode t)
(pcase (cons (not (null (executable-find "git")))
             (not (null treemacs-python-executable)))
  (`(t . t)
   (treemacs-git-mode 'deferred))
  (`(t . _)
   (treemacs-git-mode 'simple)))

(global-set-key (kbd "M-0")       #'treemacs-select-window)
(global-set-key (kbd "C-x t 1")   #'treemacs-delete-other-windows)
(global-set-key (kbd "C-x t t")   #'treemacs)
(global-set-key (kbd "C-x t B")   #'treemacs-bookmark)
(global-set-key (kbd "C-x t C-t") #'treemacs-find-file)
(global-set-key (kbd "C-x t M-t") #'treemacs-find-tag)

(install-pkg 'treemacs-projectile)
(dolist (hook (list 'treemacs-mode-hook 'projectile-mode-hook))
  (add-hook hook #'treemacs-projectile))

(provide 'init-treemacs)

;;; init-treemacs.el ends here
