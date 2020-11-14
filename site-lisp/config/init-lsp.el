;;; init-lsp.el --- Settings for Lsp
;;; Code:
(leaf lsp-mode
  :ensure t
  :hook (c-mode-hook c++-mode-hook lisp-mode-hook js-mode-hook web-mode-hook python-mode-hook)
  :bind
  ("C-' F" . lsp-format-buffer)
  :config
  (lsp)
  :custom
  (lsp-idle-delay . 1200)
  (lsp-auto-guess-root . nil)
  (lsp-file-watch-threshold . 2000)
  (lsp-eldoc-hook . nil)
  (lsp-log-io . nil)
  (lsp-enable-folding . nil)
  (lsp-enable-snippet . nil)
  (lsp-prefer-flymake . :none))

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

;;; Lsp Pyright
(leaf lsp-pyright
  :ensure t
  :hook python-mode-hook
  :config
  (lambda () (require 'lsp-pyright) (lsp)))

;;; Nox
(use-package nox
  :load-path "~/.emacs.d/site-lisp/extensions/nox/"
  :hook lsp-mode-hook
  :config
  (nox))

;;; Lsp Treemacs
(use-package lsp-treemacs :ensure t)

(provide 'init-lsp)

;;; init-lsp.el ends here
