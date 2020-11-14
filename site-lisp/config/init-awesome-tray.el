;;; init-awesome-tray.el --- Settings for Awesome Tray
;;; Code:
(leaf awesome-tray
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tray/"
  :hook after-init-hook
  :config
  (awesome-tray-mode)
  :custom
  (awesome-tray-refresh-idle-delay . 0.01)

  (awesome-tray-active-modules . '("git"
                                   "location"
                                   "mode-name"
                                   "parent-dir"
                                   "buffer-name"
                                   "buffer-read-only"
                                   "date")))

(provide 'init-awesome-tray)

;;; init-awesome-tray.el ends here
