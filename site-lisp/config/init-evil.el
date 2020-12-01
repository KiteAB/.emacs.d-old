;;; init-evil.el --- Settings for evil
;;; Code:
(use-package evil-leader
  :ensure t
  :demand
  :hook (after-init-hook . global-evil-leader-mode))

(use-package evil
  :ensure t
  :demand
  :config
  (defun evil-change-to-emacs-state ()
    "Change current state to Emacs state."
    (interactive)
    (evil-change-state 'emacs))
  :hook ((global-evil-leader-mode-hook . evil-mode)
         (Info-selection-hook . evil-change-to-emacs-state)))

(use-package evil-nerd-commenter
  :ensure t)

;; Functions
(defun set-movement-evil-states-keys (key def)
  (dolist (state '(normal visual motion))
    (evil-global-set-key state key def)))

(defun set-in-navigation-evil-states (key def)
  (dolist (state '(normal insert visual replace))
    (evil-global-set-key state key def)))

;; Motions
(evil-define-motion kiteab/+-5-lines ()
  "Move up 5 lines."
  :type line
  (evil-previous-line 5))

(evil-define-motion kiteab/--5-lines ()
  "Move down 5 lines."
  :type line
  (evil-next-line 5))

;; Basic keys
(set-movement-evil-states-keys "u" 'evil-previous-line)
(set-movement-evil-states-keys "e" 'evil-next-line)
(set-movement-evil-states-keys "n" 'evil-backward-char)
(set-movement-evil-states-keys "i" 'evil-forward-char)
(set-movement-evil-states-keys "K" 'evil-insert-line)
(set-movement-evil-states-keys "N" 'evil-beginning-of-line)
(set-movement-evil-states-keys "I" 'evil-end-of-line)
(set-movement-evil-states-keys "U" 'kiteab/+-5-lines)
(set-movement-evil-states-keys "E" 'kiteab/--5-lines)

;; Other movement keys
(evil-global-set-key 'visual "k" 'evil-insert)
(evil-global-set-key 'normal "k" 'evil-insert)
(evil-global-set-key 'motion ":" 'counsel-M-x)
(evil-global-set-key 'motion ";" 'counsel-M-x)
(evil-global-set-key 'normal "S" 'save-buffer)
(evil-global-set-key 'normal "Q" 'kill-current-buffer)
(evil-global-set-key 'normal "l" 'undo)
(set-movement-evil-states-keys "-" 'evil-search-previous)
(set-movement-evil-states-keys "=" 'evil-search-next)
(set-movement-evil-states-keys "s" 'eval-last-sexp)

(evil-global-set-key 'normal "/" 'swiper)
(evil-global-set-key 'insert (kbd "M-p") 'previous-line)
(evil-global-set-key 'insert (kbd "M-n") 'next-line)
(evil-global-set-key 'insert (kbd "C-p") 'evil-normal-state)
(evil-global-set-key 'replace (kbd "C-p") 'evil-normal-state)

;; Leader key
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; File
  "xf" 'find-file

  ;; Packages keys
  "g" 'magit-status)

(provide 'init-evil)

;;; init-evil.el ends here
