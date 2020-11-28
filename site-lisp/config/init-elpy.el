;;; init-elpy.el --- Settings for elpy
;;; Code:
(use-package elpy
  :ensure t
  :config
  (with-eval-after-load 'python
    (unless (or (not buffer-file-name)
                (string= (file-name-extension buffer-file-name) "org"))
      (elpy-enable))))

(provide 'init-elpy)

;;; init-elpy.el ends here
