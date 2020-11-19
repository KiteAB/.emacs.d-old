;;; init-eaf.el --- Settings for emacs application framework
;;; Code:
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/extensions/emacs-application-framework"
  :bind ("C-q C-b o" . eaf-open-browser)
  :config
  (setq eaf-grip-token "c9a51aa390cd3bce36a7d307d404d2aeb030f707")
  (eaf-setq eaf-browser-remember-history "true")
  (eaf-setq eaf-browser-default-zoom "1.5")
  (eaf-setq eaf-terminal-font-family "Sarasa Mono Slab SC Semibold")
  (setq eaf-browser-search-engines '(("Baidu" . "https://www.baidu.com/s?wd=%s")
                                     ("Bing" . "https://cn.bing.com/search?q=%s")))
  (setq eaf-browser-default-search-engine "Bing")
  (defalias 'browse-web 'eaf-open-browser)
  ;; (if (and
  ;;      (< (car (circadian-sunrise))
  ;;         (car (circadian-now-time)))
  ;;      (> (car (circadian-sunset))
  ;;         (car (circadian-now-time))))
  ;;     (eaf-setq eaf-browser-dark-mode "false")
  ;;   (eaf-setq eaf-browser-dark-mode "true"))
  (eaf-setq eaf-browser-dark-mode "true"))

(provide 'init-eaf)

;;; init-eaf.el ends here
