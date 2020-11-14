;;; init-web-mode.el --- Settings for Web Mode
;;; Code:
(leaf web-mode
  :ensure t
  :config
  (setq-default web-mode-markup-indent-offset 2 ; Indent of HTML
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2) ; Indent of JavaScript in HTML
  :custom
  (auto-mode-alist . (append '(("\\.html\\" . web-mode)) auto-mode-alist)))

;;; Emmet Mode
(leaf emmet-mode
  :ensure t
  :hook web-mode-hook
  :config
  (emmet-mode)
  :custom
  (emmet-self-closing-tag-style . " /"))

(provide 'init-web-mode)

;;; init-web-mode.el ends here
