;;;; This file is used for the keybindings
;;; User Functions -> Keybindings
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-q") 'ctl-z-map)
(global-set-key (kbd "C-q c") 'open-etc-config)
(global-set-key (kbd "C-q w") 'window-move)
(global-set-key (kbd "C-q a") 'set-alpha)
(global-set-key (kbd "C-q S") 'sudo-save)
(global-set-key (kbd "C-q l") 'kiteab/copy-license)
(global-set-key (kbd "C-q s") 'kiteab/open-scratch)
(global-set-key (kbd "C-q A") 'kiteab/touch-not-alpha)
(global-set-key (kbd "C-q TAB") 'kiteab/open-erc)
(global-set-key (kbd "C-q t") 'kiteab/add-todo-in-code)
(global-set-key (kbd "C-q k") 'kiteab/kill-unwanted-buffers)
(global-set-key (kbd "C-q C-s") 'kiteab/search-engine)
(global-set-key (kbd "C-q i") 'kiteab/change-indent-type)
(global-set-key (kbd "C-q C-e s") 'kiteab/edit-snippets)
(global-set-key (kbd "C-q p") 'kiteab/provide-feature-name)
(global-set-key (kbd "C-q I") 'kiteab/indent-one-time)

;;; Built-in Functions -> Keybindings
(global-set-key (kbd "C-q C-p") 'previous-buffer)
(global-set-key (kbd "C-q C-n") 'next-buffer)
(global-set-key (kbd "C-q m") 'set-mark-command)
(global-set-key (kbd "C-q f") 'mark-defun)
(global-set-key (kbd "C-q u") 'undo-only)
;; (global-set-key (kbd "C-q r") 'undo-redo) ; Emacs 28 only
(global-set-key (kbd "C-q r") 'query-replace)
(global-set-key (kbd "C-q C-f") 'make-empty-file)
(global-set-key (kbd "C-q e") 'eshell)
(global-set-key (kbd "C-q C-d") 'delete-char)
(global-set-key (kbd "C-q M-p") 'list-processes)
(global-set-key (kbd "C-q g") 'goto-line)

;; Key Macros
(global-set-key (kbd "C-q C-k i") 'insert-placeholder)  ; Insert Placeholder
(global-set-key (kbd "C-q C-k r") 'replace-placeholder) ; Replace Placeholder
(global-set-key (kbd "C-q C-k s") 'search-todo-in-code) ; Search the todo thing in code

(provide 'init-keybindings)
