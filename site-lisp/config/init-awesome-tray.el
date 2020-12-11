;;; init-awesome-tray.el --- Settings for awesome tray
;;; Code:
(use-package awesome-tray
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tray"
  :hook (after-init-hook . awesome-tray-mode)
  :config
  (setq awesome-tray-refresh-idle-delay 0.01)

  (defun kiteab/awesome-tray-meow-info ()
    (meow-indicator))
  (add-to-list 'awesome-tray-module-alist '("meow" . (kiteab/awesome-tray-meow-info)))

  (defun kiteab/awesome-tray-emacs-info ()
    (concat "KiteAB Emacs"))
  (add-to-list 'awesome-tray-module-alist '("emacs" . (kiteab/awesome-tray-emacs-info awesome-tray-module-battery-face)))

  (setq awesome-tray-active-modules '("git"
                                      "location"
                                      "mode-name"
                                      "parent-dir"
                                      "buffer-name"
                                      "buffer-read-only"
                                      "meow"
                                      "date"
                                      "emacs")))

(provide 'init-awesome-tray)

;;; init-awesome-tray.el ends here
