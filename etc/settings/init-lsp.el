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

(provide 'init-lsp)
