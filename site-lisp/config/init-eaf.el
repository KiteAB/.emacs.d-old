;;; init-eaf.el --- Settings for Emacs Application Framework
;;; Code:
(leaf eaf
  :load-path "~/.emacs.d/site-lisp/extensions/emacs-application-framework/"
  :require t
  :bind
  ("C-q C-b o" . eaf-open-browser)
  :config
  (eaf-setq eaf-browser-remember-history "true")
  (eaf-setq eaf-browser-default-zoom "1.5")
  (eaf-setq eaf-terminal-font-family "Sarasa Mono Slab SC Semibold")
  (eaf-setq eaf-browser-dark-mode "true")
  :custom
  (eaf-grip-token . "c9a51aa390cd3bce36a7d307d404d2aeb030f707")
  (eaf-browser-search-engines . '(("Baidu" . "https://www.baidu.com/s?wd=%s")
                                  ("Bing" . "https://cn.bing.com/search?q=%s")))
  (eaf-browser-default-search-engine . "Bing"))

(provide 'init-eaf)

;;; init-eaf.el ends here
