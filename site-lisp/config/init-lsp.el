;;; This file is used for Lsp Mode Settings
;;; Lsp Mode
(use-package lsp-mode
  :ensure t
  :hook ((c-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook) . lsp)
  :bind ("C-' F" . lsp-format-buffer)
  :config
  (setq lsp-idle-delay 1200
        lsp-auto-guess-root nil
        lsp-file-watch-threshold 2000
        lsp-eldoc-hook nil
        lsp-log-io nil
        lsp-enable-folding nil
        lsp-enable-snippet nil
        lsp-prefer-flymake :none))

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

;;; Lsp User Interface
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  ;; SideLine
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-delay 5)
  ;; Peek
  (setq lsp-ui-peek-enable t)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] 'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] 'lsp-ui-peek-find-references)
  ;; Documents
  (setq lsp-ui-doc-enable t))

;;; Lsp Treemacs
(use-package lsp-treemacs :ensure t)

(provide 'init-lsp)
