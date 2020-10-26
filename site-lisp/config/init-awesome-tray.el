;;; This file is used for Awesome Tray Settings
(use-package awesome-tray
  :load-path "~/.emacs.d/site-lisp/extensions/awesome-tray"
  :hook (after-init-hook . awesome-tray-mode)
  :config
  (defun kiteab/awetray-current-input-method ()
    (if (eq current-input-method nil)
        "EN"
      "ZH"))
  (add-to-list 'awesome-tray-module-alist '("current-input-method" . (kiteab/awetray-current-input-method awesome-tray-module-battery-face)))

  (defun kiteab/awetray-buffer-read-only ()
    (if (and (eq buffer-read-only t) (not (eq buffer-file-name nil)))
        "R-O"))
  (add-to-list 'awesome-tray-module-alist '("buffer-read-only" . (kiteab/awetray-buffer-read-only awesome-tray-module-git-face)))

  (defun kiteab/awetray-buffer-name ()
    (if (and (buffer-modified-p) (not (eq buffer-file-name nil)))
        (concat (buffer-name) "*")
      (buffer-name)))
  (add-to-list 'awesome-tray-module-alist '("buffer-name-plus" . (kiteab/awetray-buffer-name awesome-tray-module-buffer-name-face)))

  (setq awesome-tray-active-modules '("git" "location" "current-input-method" "mode-name" "parent-dir" "buffer-name-plus" "buffer-read-only" "date")))

(provide 'init-awesome-tray)
