;;; This file is used for Things Need to Autoload
;; Automatic Optimization
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

(provide '+autoload)
