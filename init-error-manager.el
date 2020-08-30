;;;; This file is used for error-capture's functions

;; Define the config errors variable
(defvar spring/all-the-config-errors nil
	"All the config errors when start emacs.
If it's nil, there is no error.
If it's a list, all the items of list are the error contents.")

;; Define the error-from string
(defconst spring/error-from
	'("error from [[file:" "][" "]]")
	"The error-from strings")

;;;###autoload
(cl-defun spring/error-check (origin &rest options)
	"Check if the code of ORIGIN's position is error with OPTIONS."
	(when (listp options)
		(dolist (option options)
			(pcase option
				(:file-exists
				 (let
						 ((file-path
							 (nth (+ 1
											 (cl-position option options))
										options)))
					 (if (not (file-exists-p file-path))
							 (progn
								 (setf spring/all-the-config-errors
											 (append spring/all-the-config-errors
															 (list
																(cl-concatenate 'string "File does not exist: '" file-path "', "
																						 (car spring/error-from) (car origin) (cadr spring/error-from)
																						 (cadr origin) (caddr spring/error-from)))))
								 (message "The %s file is not exists." file-path))
						 (cl-return-from spring/error-check t)))))))
	nil)

;;;###autoload
(defun spring/error-close ()
	"Close the error buffer & window."
	(interactive)
	(local-unset-key (kbd "q"))
	(kill-buffer-and-window))

;;;###autoload
(defun spring/error-show ()
	"Show all the errors in the while of starting emacs."
	(interactive)
	(if (null spring/all-the-config-errors)
			(message "There is no error while starting emacs.")
		(split-window-below)
		(switch-to-buffer "*All-Errors*")
		(org-mode)
		(dolist (err spring/all-the-config-errors)
			(insert err)
			(insert "\n"))
		(local-set-key (kbd "q") 'spring/error-close)
		(message "Press q for quit, C-c C-o for opening the link.")
		(setq buffer-read-only t)))

(provide 'init-error-manager)
