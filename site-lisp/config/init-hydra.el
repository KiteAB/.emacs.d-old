;;; init-hydra.el --- Settings for hyrda
;;; Code:
(use-package hydra
  :ensure t)

(use-package hydra-posframe
  :load-path "~/.emacs.d/site-lisp/extensions/hydra-posframe"
  :hook (after-init-hook . hydra-posframe-mode))

(use-package major-mode-hydra
  :ensure t
  :after hydra)


(defhydra kiteab/hydra-function-menu ()
  "^Functions^
[_TAB_] ERC"
  ("TAB" kiteab/open-erc nil :color blue))

(defhydra kiteab/hydra-main-menu (:color blue)
  "^Main Menu^
[_f_] ^Functions^"
  ("f" kiteab/hydra-function-menu/body nil)
  ("q" nil "quit"))

(global-set-key (kbd "M-\\") 'kiteab/hydra-main-menu/body)

(provide 'init-hydra)

;;; init-hydra.el ends here
