;;; init-xah-fly-keys.el --- Settings for xah fly keys
;;; Code:
(require 'xah-fly-keys)

(xah-fly-keys 1)

(defun xfk-define-in-all-modes (key def)
  (define-key xah-fly-command-map (kbd key) def)
  (define-key xah-fly-insert-map  (kbd key) def))

(defun xfk-define-command-key (key func)
  (define-key xah-fly-command-map (kbd key) func))

(defun xfk-define-insert-key (key func)
  (define-key xah-fly-insert-map (kbd key) func))

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

(xah-fly-keys-set-layout "colemak")

(add-hook 'magit-mode-hook #'(lambda () (interactive) (xah-fly-keys -1)))

(xfk-define-in-all-modes "<f11>" #'toggle-frame-fullscreen)
(xfk-define-in-all-modes "C-n"   #'next-line)
(xfk-define-in-all-modes "C-a"   #'beginning-of-line)

(define-key xah-fly-insert-map  [escape] #'xfk-backward-char-and-command)
(define-key xah-fly-command-map [escape] #'mode-line-other-buffer)

(xfk-define-command-key "t"     nil)
(xfk-define-command-key "M-SPC" nil)

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

(xfk-define-command-key "?" 'help-command)

(provide 'init-xah-fly-keys)

;;; init-xah-fly-keys.el ends here
