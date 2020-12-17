;;; init-xfk.el --- Settings for xah fly keys
;;; Code:
(unless (package-installed-p 'xah-fly-keys)
  (package-refresh-contents)
  (package-install 'xah-fly-keys))

(require 'xah-fly-keys)

(xah-fly-keys 1)

(xah-fly-keys-set-layout "colemak")

(defun xfk-define-in-all-modes (key def)
  (define-key xah-fly-command-map (kbd key) def)
  (define-key xah-fly-insert-map  (kbd key) def))

(defun xfk-define-command-key (key func)
  (define-key xah-fly-command-map (kbd key) func))

(defun xfk-define-insert-key (key func)
  (define-key xah-fly-insert-map (kbd key) func))

(defun xfk-define-prefix-key (prefix key)
  (define-prefix-command prefix)
  (xfk-define-command-key (kbd key) prefix))

(defun xfk-define-prefix-key-with-leader (prefix key)
  (define-prefix-command prefix)
  (xfk-define-command-key (kbd (concat "SPC " key)) prefix))

(defun xfk-define-leader-key (key func)
  (define-key xah-fly-command-map (kbd (concat "SPC " key)) func))

;; Motions
(defun xfk-up-5-lines ()
  (interactive)
  (previous-line 5))

(defun xfk-down-5-lines ()
  (interactive)
  (next-line 5))

(defun xfk-insert-at-beginning ()
  (interactive)
  (beginning-of-line)
  (xah-fly-insert-mode-activate))

(defun xfk-insert-at-end ()
  (interactive)
  (end-of-line)
  (xah-fly-insert-mode-activate))

(defun xfk-forward-char ()
  (interactive)
  (when (< (point) (line-end-position))
    (forward-char (abs (prefix-numeric-value nil)))))

(defun xfk-backward-char ()
  (interactive)
  (when (> (point) (line-beginning-position))
    (backward-char (abs (prefix-numeric-value nil)))))

(defun xfk-forward-char-and-insert ()
  (interactive)
  (xfk-forward-char)
  (xah-fly-insert-mode-activate))

(defun xfk-backward-char-and-command ()
  (interactive)
  (xfk-backward-char)
  (xah-fly-command-mode-activate))

(defun xfk-newline-below-and-insert ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (xah-fly-insert-mode-activate)
  (indent-for-tab-command))

(defun xfk-newline-top-and-insert ()
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (xah-fly-insert-mode-activate)
  (indent-for-tab-command))

(defun xfk-next-word ()
  (interactive)
  (right-word)
  (forward-char))

(add-hook 'magit-mode-hook #'(lambda () (interactive) (xah-fly-keys -1)))

;; Basics
(xfk-define-in-all-modes "<f11>" #'toggle-frame-fullscreen)
(xfk-define-in-all-modes "C-n"   #'next-line)
(xfk-define-in-all-modes "C-a"   #'beginning-of-line)

(define-key xah-fly-insert-map  [escape] #'xfk-backward-char-and-command)
(define-key xah-fly-command-map [escape] #'mode-line-other-buffer)

(xfk-define-command-key  "t"     nil)
(xfk-define-command-key  "j"     nil)
(xfk-define-in-all-modes "C-s"   nil)
(xfk-define-in-all-modes "C-w"   nil)
(xfk-define-command-key  "M-SPC" nil)

(xfk-define-command-key "n" #'xfk-backward-char)
(xfk-define-command-key "i" #'xfk-forward-char)

(xfk-define-command-key "N" #'beginning-of-line)
(xfk-define-command-key "I" #'end-of-line)
(xfk-define-command-key "k" #'xah-fly-insert-mode-activate)
(xfk-define-command-key "S" #'save-buffer)
(xfk-define-command-key "Q" #'kill-current-buffer)
(xfk-define-command-key "U" #'xfk-up-5-lines)
(xfk-define-command-key "E" #'xfk-down-5-lines)
(xfk-define-command-key "K" #'xfk-insert-at-beginning)
(xfk-define-command-key "A" #'xfk-insert-at-end)
(xfk-define-command-key "a" #'xfk-forward-char-and-insert)
(xfk-define-command-key "v" #'set-mark-command)
(xfk-define-command-key "x" #'delete-char)
(xfk-define-command-key "l" #'undo-only)
(xfk-define-command-key "/" #'swiper)
(xfk-define-command-key ";" #'counsel-M-x)
(xfk-define-command-key ":" #'counsel-M-x)

(xfk-define-command-key "h" 'help-command)

;; With prefix
;; Beginning/End of buffer
(xfk-define-prefix-key 'xfk-g-command "g")
(xfk-define-command-key "gg" #'beginning-of-buffer)
(xfk-define-command-key "G"  #'end-of-buffer)

;; New line
(xfk-define-command-key "o" #'xfk-newline-below-and-insert)
(xfk-define-command-key "O" #'xfk-newline-top-and-insert)

;; Cut/Copy/Paste
(xfk-define-command-key "p" #'yank)
(xfk-define-command-key "y" #'kill-ring-save)
(xfk-define-command-key "d" #'kill-region)

;; Word move
(xfk-define-command-key "w" #'xfk-next-word)

;; With leader key
;; Built-in function keys
;; File
(xfk-define-prefix-key-with-leader 'xfk-leader-f-command "f")
(xfk-define-leader-key "ff" #'find-file)
;; Window


;; Buffer


;; Useful
(xfk-define-prefix-key-with-leader 'xfk-leader-z-command "z")
(xfk-define-leader-key "zf" #'mark-defun)
(xfk-define-leader-key "zl" #'undo)
(xfk-define-leader-key "zr" #'query-replace)
(xfk-define-leader-key "ze" #'eshell)
(xfk-define-leader-key "zp" #'list-processes)
(xfk-define-leader-key "zg" #'goto-line)
(xfk-define-leader-key "za" #'align-regexp)

;; Save buffers kill terminal
(xfk-define-leader-key "Q" #'save-buffers-kill-terminal)

;; init-functions.el
(xfk-define-prefix-key-with-leader 'xfk-leader-q-command "q")
(xfk-define-leader-key "c"   #'open-config-folder)
(xfk-define-leader-key "C"   #'open-require-file)
(xfk-define-leader-key "a"   #'set-alpha)
(xfk-define-leader-key "s"   #'kiteab/open-scratch)
(xfk-define-leader-key "T"   #'kiteab/add-todo-in-code)
(xfk-define-leader-key "i"   #'kiteab/change-indent-type)
(xfk-define-leader-key "p"   #'kiteab/provide-feature-name)
(xfk-define-leader-key "t"   #'kiteab/insert-current-date-time)
(xfk-define-leader-key "u"   #'kiteab/upgrade-modules)
(xfk-define-leader-key "TAB" #'kiteab/open-erc)
(xfk-define-leader-key "SPC" #'kiteab/format-commit)

;; Package keys
;; Magit
(xfk-define-leader-key "m" #'magit)

;; Evil Nerd Commenter
(xfk-define-leader-key "c" #'evilnc-comment-or-uncomment-lines)

(provide 'init-xfk)

;;; init-xfk.el ends here
