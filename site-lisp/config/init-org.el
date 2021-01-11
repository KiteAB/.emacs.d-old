;;; init-org.el --- Settings for org mode

;; Filename: init-org.el
;; Description: Settings for org mode
;; Author: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Maintainer: KiteAB <kiteabpl@outlook.com> (https://kiteab.ga)
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Created: 2020-12-10 20:59:12
;; Last-Updated: 2020-12-20 16:27:05
;;           By: KiteAB
;; URL: https://github.com/KiteAB/.emacs.d/blob/master/site-lisp/config/init-org.el
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
;; Settings for org mode
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

(install-pkg 'org)

(define-prefix-command 'org-key-map)
(global-set-key (kbd "C-q C-c") 'org-key-map)

(lazy-load-global-keys
 '(("C-q C-c g"   . org-agenda)
   ("C-q C-c c"   . org-capture)
   ("C-q C-c s"   . org-timer-start)
   ("C-q C-c S"   . org-timer-set-timer)
   ("C-q C-c e"   . org-timer-stop)
   ("C-q C-c SPC" . org-timer-pause-or-continue)
   ("C-q C-c C-i" . kiteab/use-space-indent))
 "org")

(add-hook 'org-mode-hook #'(lambda ()
                             (setq indent-tabs-mode nil)
                             (define-key org-mode-map (kbd "C-'") nil)))

(setq org-log-mode 'note) ; Set the log mode type
(setq org-src-fontify-natively t)
(setq org-startup-folded nil) ; Don't fold contents by normal
(setq org-todo-keywords
      '((sequence "TODO(t)" "STUDY(s)" "WAIT(w@/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")
        (sequence "BUG(b)" "KNOWN(k)" "|" "FINISHED(f@/!)"))) ; Set the todo's keywords
(setq org-tag-alist '(("@code" . ?c) ("@life" . ?l))) ; Set the org tags keyword
(setq org-M-RET-may-split-line '((headline . nil))) ; Don't split text
(setq org-hide-leading-stars t) ; Hide the leading stars
(setq org-odd-levels-only t) ; Only odd the levels
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t) ; Highlight code in babel and not ask

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (shell . t)))

;; GTD
(unless (file-exists-p "~/.emacs.d/gtd")
  (make-directory "~/.emacs.d/gtd"))
(setq org-agenda-files '("~/.emacs.d/gtd"))
(defvar org-agenda-dir "" "gtd org files location")
(setq-default org-agenda-dir "~/.emacs.d/gtd")
;; org-agenda-dir files
(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
(setq org-agenda-file-insp (expand-file-name "insps.org" org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "tasks.org" org-agenda-dir))
(setq org-capture-templates
      '(("t" "Task")
        ("tw" "Work Task" entry (file+headline org-agenda-file-task "Work")
         "* TODO %T - %^{Work Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("ts" "Study Task" entry (file+headline org-agenda-file-task "Study")
         "* STUDY %T - %^{Study Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("i" "inspiration" entry (file+headline org-agenda-file-insp "Inspiration")
         "* %^{Inspiration Mainly Content} \n  %?")
        ("n" "Note" entry (file+headline org-agenda-file-note "Note")
         "* %^{Note Mainly Content} \n  %?")))

;; PDF & Latex
(setq org-latex-pdf-process '("xelatex -file-line-error -interaction nonstopmode %f"
                              "bibtex %b"
                              "xelatex -file-line-error -interaction nonstopmode %f"
                              "xelatex -file-line-error -interaction nonstopmode %f"))
(setq org-latex-logfiles-extensions
      '("lof" "lot" "tex" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg""brf" "fls" "entoc" "ps" "spl" "bbl" "xdv"))
(setq org-image-actual-width '(300))
(setq org-export-with-sub-superscripts nil)

;; Org Bullets
;; (install-pkg 'org-bullets)
;; (add-hook 'org-mode-hook #'(lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("☰" "☷" "✿" "☭"))

(provide 'init-org)

;;; init-org.el ends here
