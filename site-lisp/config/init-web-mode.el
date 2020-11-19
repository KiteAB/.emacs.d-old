;;; init-web-mode.el --- Settings for web mode
;;; Code:
(use-package web-mode
  :ensure t
  :config
  (setq auto-mode-alist
        (append '(("\\.html\\'" . web-mode)) auto-mode-alist))
  (setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2)) ; Indent of JavaScript in HTML

;;; Emmet Mode
(use-package emmet-mode
  :ensure t
  :hook (web-mode-hook . emmet-mode)
  :config (setq emmet-self-closing-tag-style " /"))

(provide 'init-web-mode)

;;; init-web-mode.el ends here
