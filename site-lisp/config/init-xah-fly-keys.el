;;; init-xah-fly-keys.el --- Settings for xah fly keys
;;; Code:
(require 'xah-fly-keys)

(xah-fly-keys 1)

(defun xfk-define-in-all-modes (key def)
  (define-key xah-fly-command-map (kbd key) def)
  (define-key xah-fly-insert-map (kbd key) def))

(defun xfk-last-buffer (arg)
  (interactive "P")
  (if (not arg)
      (mode-line-other-buffer)
    (split-window)
    (mode-line-other-buffer)))

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

(xah-fly-keys-set-layout "colemak")

(add-hook 'magit-mode-hook #'(lambda () (interactive) (xah-fly-keys -1)))

(xfk-define-in-all-modes "<f11>" #'toggle-frame-fullscreen)
(xfk-define-in-all-modes "C-n" #'next-line)
(xfk-define-in-all-modes "C-a" #'beginning-of-line)

(define-key xah-fly-insert-map  [escape]    #'xah-fly-command-mode-activate)
(define-key xah-fly-command-map [escape]    #'xfk-last-buffer)
(define-key xah-fly-command-map (kbd "N")   #'beginning-of-line)
(define-key xah-fly-command-map (kbd "I")   #'end-of-line)
(define-key xah-fly-command-map (kbd "k")   #'xah-fly-insert-mode-activate)
(define-key xah-fly-command-map (kbd "S")   #'save-buffer)
(define-key xah-fly-command-map (kbd "Q")   #'kill-current-buffer)
(define-key xah-fly-command-map (kbd "U")   #'xfk-up-5-lines)
(define-key xah-fly-command-map (kbd "E")   #'xfk-down-5-lines)
(define-key xah-fly-command-map (kbd "K")   #'xfk-insert-at-beginning)
(define-key xah-fly-command-map (kbd "A")   #'xfk-insert-at-end)

(provide 'init-xah-fly-keys)

;;; init-xah-fly-keys.el ends here
