;;;; This file is used for Lsp Mode settings

(defvar lsp-on-touch-time 0
  "The lsp-on-change's time.")

(eval-after-load 'lsp-mode
  '(progn
     (defvar lsp-on-touch-time 0)
     (defadvice lsp-on-change (around lsp-on-change-hack activate)
       ;; don't run `lsp-on-change' too frequently
       (when (> (- (float-time (current-time))
                   lsp-on-touch-time) 30)
         (setq lsp-on-touch-time (float-time (current-time)))
         ad-do-it))))

;;;; Lsp User Interface
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  ;; SideLine
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-delay 5)
  ;; Peek
  (setq lsp-ui-peek-enable t)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; Documents
  (setq lsp-ui-doc-enable t))

(provide 'init-lsp)
