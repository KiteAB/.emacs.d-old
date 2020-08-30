;;;; This file is used to define functions about the disabled commands

(defconst spring/enable-commands
	'(narrow-to-region downcase-region upcase-region)
	"The disabled commands that I want to enable.")

;;;###autoload
(defun enable-commands (commands)
	"Enable the disbaled command like `enable-command', but it can enable more than one command at once."
	(dolist (command commands)
		(when command
			(en/disable-command command nil))))

;;;###autoload
(defun disable-commands (commands)
	"Disable command like `disable-command', but it can disbale more than one command at once."
	(dolist (command commands)
		(when command
			(en/disable-command command t))))

;;;###autoload
(defun enable-commands-init ()
	"Enable some commands."
	(let ((enable-file
				 (expand-file-name (locate-user-emacs-file "enable-commands")))
				(disable-file
				 (expand-file-name (locate-user-emacs-file "disable-commands")))
				y-or-n)
		(if (and (not (file-exists-p enable-file))
						 (not (file-exists-p disable-file)))
				(progn
					(setq y-or-n
								(read-minibuffer
								 "Do you want to enable some disabled commands?It's a little dangerous!(y/n)"
								 "n"))
					(if (string= y-or-n "y")
							(progn
								(enable-commands spring/enable-commands)
								(make-empty-file enable-file))
						(make-empty-file disable-file)))
			(when (file-exists-p enable-file)
				(enable-commands spring/enable-commands)))))

(provide 'init-enable-disabled-commands)
