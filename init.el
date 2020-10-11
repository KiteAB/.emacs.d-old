;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  _  ___ _         _   ___   ___                   ;;
;; | |/ (_) |_ ___  /_\ | _ ) | __|_ __  __ _ __ ___ ;;
;; | ' <| |  _/ -_)/ _ \| _ \ | _|| '  \/ _` / _(_-< ;;
;; |_|\_\_|\__\___/_/ \_\___/ |___|_|_|_\__,_\__/__/ ;;
;;                                                   ;;
;; Repository: https://github.com/KiteAB/.emacs.d    ;;
;; Author: KiteAB <https://github.com/KiteAB>        ;;
;; E-Mail: <kiteabpl@outlook.com>                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Automatic Optimization
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq inhibit-compacting-font-caches nil)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda ()
                             (setq gc-cons-threshold gc-cons-threshold-original)
                             (setq file-name-handler-alist file-name-handler-alist-original)
                             (makunbound 'gc-cons-threshold-original)
                             (makunbound 'file-name-handler-alist-original)))

;;;; Traverse Load Configuration Folder
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))

;;; Require Configuration Files
(require 'init-config)

;;; Display Startup Time
(add-hook 'emacs-startup-hook (lambda ()
                                (message "Emacs started in %s with %d garbage collections."
                                         (format "%.2f seconds"
                                                 (float-time
                                                  (time-subtract after-init-time before-init-time)))
                                         gcs-done)))
