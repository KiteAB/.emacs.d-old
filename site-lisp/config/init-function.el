;;; init-function.el --- Settings for functions

;; Filename: init-function.el
;; Description: Settings for functions
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-18 21:18:15
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-function.el
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
;; Settings for functions
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

(defun open-config-folder ()
  "Open the config file in the site-lisp/config folder."
  (interactive)
  (counsel-find-file kiteab-emacs-root-dir))

(defun open-require-file ()
  "Open init.el"
  (interactive)
  (find-file (concat kiteab-emacs-config-dir "/init.el")))

(defun set-alpha (var)
  "Set the backgroud alpha by VAR."
  (interactive "sAlpha or not(y-or-n): ")
  (pcase var
    ("y" (set-frame-parameter nil 'alpha '(90  . 100)))
    ("n" (set-frame-parameter nil 'alpha '(100 . 100)))))

(defun kiteab/open-scratch ()
  "Open the scratch buffer after closing it."
  (interactive)
  (switch-to-buffer "*scratch*")
  (insert initial-scratch-message)
  (message "[KiteAB Emacs] Open the scratch action done."))

(defun kiteab/open-erc ()
  "Open the erc with only one time."
  (interactive)
  (let ((erc-file-path
         (expand-file-name (locate-user-emacs-file
                            "erc-userinfo"))))
    (if (file-exists-p erc-file-path)
        (let ((user-info
               (with-temp-buffer (insert-file-contents
                                  erc-file-path)
                                 (split-string (buffer-string)
                                               "\n" t))))
          (erc :nick (car user-info) :password (nth 1 user-info)))
      (let ((user-name (read-string "[KiteAB Emacs] ERC Nick: "))
            (user-password (read-passwd "[KiteAB Emacs] ERC Password: "))
            save-y-or-n)
        (if (or (string= user-name "")
                (string= user-password ""))
            (error "[KiteAB Emacs] The user name or password can't be null!")
          (setq save-y-or-n (read-minibuffer
                             "[KiteAB Emacs] Do you want to save your ERC user info? (y-or-n): "
                             "y"))
          (when (string= save-y-or-n "y")
            (with-temp-file erc-file-path
              (insert (format "%s\n" user-name))
              (insert (format "%s" user-password))))
          (erc :nick user-name :password user-password))))))

(defun kiteab/add-todo-in-code ()
  "Add todo content in code."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (progn
        (comment-dwim nil)
        (let ((todo-content (read-string "[KiteAB Emacs] Enter your todo content: ")))
          (insert (format "<TODO(KiteAB)> %s [%s]" todo-content (current-time-string)))))
    (message "[KiteAB Emacs] Not in emacs-lisp-mode.")))

(defun kiteab/kill-unwanted-buffers ()
  "Kill unwanted buffers for me."
  (interactive)
  (progn
    (kill-buffer "*Help*")
    (kill-buffer "*Backtrace*")))

(defun kiteab/search-engine ()
  "Open search page by eaf-browser."
  (interactive "M[KiteAB Emacs] The text you want to search: ")
  (eaf-open-browser (concat "https://cn.bing.com/search?q=" content)))

(defun kiteab/change-indent-type (type)
  "Change the indent type."
  (interactive (list (completing-read "[KiteAB Emacs] Enter the indent type: "
                                      '("tab" "space"))))
  (pcase type
    ("tab" (setq-local indent-tabs-mode t))
    ("space" (setq-local indent-tabs-mode nil))))

(defun kiteab/provide-feature-name ()
  "Provide feature name automaticly."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (insert (format "(provide '%s)" (car (split-string (buffer-name) ".el"))))
    (message "[KiteAB Emacs] Not in emacs-lisp-mode. Exiting.")))

(defun kiteab/insert-current-date-time ()
  "Insert current date time at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

(defun kiteab/upgrade-modules ()
  "Upgrade modules in `kiteab-emacs-root-dir' git repository."
  (interactive)
  (async-shell-command (concat "cd " kiteab-emacs-root-dir " && git submodule foreach git pull")))

(defun kiteab/format-commit ()
  "Git commit with formatted text."
  (interactive)
  (setq kiteab/git-commit-type (completing-read "[KiteAB Emacs] Commit Type: "
                                                '("add" "modify" "remove" "feat" "style" "fix" "module" "rename")))
  (setq kiteab/git-commit-files (read-from-minibuffer "[KiteAB Emacs] Commit Files: "))
  (setq kiteab/git-commit-content (read-from-minibuffer "[KiteAB Emacs] Commit Content: "))
  (insert (concat kiteab/git-commit-type
                  "("
                  kiteab/git-commit-files
                  "): "
                  kiteab/git-commit-content))
  (message "[KiteAB Emacs] Action done."))

(provide 'init-function)

;;; init-function.el ends here
