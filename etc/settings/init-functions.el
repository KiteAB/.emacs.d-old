;;;; This file is used for the useful functions
(defun open-config-file ()
	"Open the init.el file."
	(interactive)
	(find-file "~/.emacs.d/init.el"))

(defun open-etc-config (index)
	"Open the config file in the etc directory."
	(interactive (list (completing-read "Enter the index of config: "
																			'("languages" "settings"))))
	(let* ((path (pcase index
								 ("languages" "~/.emacs.d/etc/languages/")
								 ("settings" "~/.emacs.d/etc/settings/")))
				 (filename
					(completing-read "Enter the filename: "
													 (delete ".." (delete "." (directory-files path))))))
		(find-file (concat path filename))))

(defun open-vterm (&optional dir)
	"Open the vterm by DIR"
	(interactive "DInput the directory: ")
	(find-file dir)
	(let ((current-buffer-name (buffer-name)))
		(vterm)
		(linum-mode -1)
		(kill-buffer current-buffer-name)))

(defun set-alpha (var)
	"Set the backgroud alpha by VAR."
	(interactive "sAlpha or not(y-or-n): ")
	(pcase var
		("y" (set-frame-parameter nil 'alpha '(90 . 100)))
		("n" (set-frame-parameter nil 'alpha '(100 . 100)))))

(defun sudo-save ()
	"Save the current buffer file with sudo."
	(interactive)
	(if (not buffer-file-name)
			(write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
		(write-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun markdown-table-keymap ()
	"Add table map in markdown mode."
	(define-key markdown-mode-map (kbd "C-c C-c TAB") 'markdown-table-align))

(defun tab-bar-new-with-buffer (buffer-name)
	"Create a new tab then select a buffer."
	(interactive "bBuffer Name: ")
	(tab-bar-new-tab)
	(switch-to-buffer buffer-name))

(defun kiteab/tab-bar-new-scratch ()
	"Create a new tab then select the *Scratch* buffer."
	(interactive)
	(tab-bar-new-tab)
	(switch-to-buffer "*scratch*"))

(defun kiteab/tab-bar-close-tab-kill-buffer ()
	"Kill the current buffer and close the current tab."
	(interactive)
	(kill-buffer)
	(tab-bar-close-tab))

(defun kiteab/copy-license (license-name)
	"Copy the license file to current directory."
	(interactive (list
								(completing-read "sLincense name: "
																 '("MIT" "GPL-3.0"))))
	(pcase license-name
		("MIT"
		 (copy-file "~/.emacs.d/license/MIT" "./LICENSE")
		 (message "Copy license action done."))
		("GPL-3.0"
		 (copy-file "~/.emacs.d/license/GPL-3.0" "./LICENSE")
		 (find-file "./LICENSE")
		 (message "Copy license action done."))))

(defun kiteab/open-scratch ()
	"Open the scratch buffer after closing it."
	(interactive)
	(switch-to-buffer "*scratch*")
	(unless (get-buffer "*scratch*")
		(insert initial-scratch-message)
		(message "Open the scratch action done.")))

(defun kiteab/use-space-indent ()
	"Use the space indent in org-mode."
	(interactive)
	(setq indent-tabs-mode nil))

(defun kiteab/touch-not-alpha ()
	"Make the not-alpha file."
	(interactive)
	(let ((file-name
				 (expand-file-name (locate-user-emacs-file "not-alpha"))))
		(unless (file-exists-p file-name)
			(make-empty-file file-name))))

(defun kiteab/open-erc ()
	"Open the erc with only one time."
	(interactive)
	(let ((erc-file-path
				 (expand-file-name (locate-user-emacs-file
														"erc-userinfo"))))
		(if (file-exists-p erc-file-path)
				(let ((user-info
							 (with-temp-buffer (insert-file-contents
																	erc-file-path)
																 (split-string (buffer-string)
																							 "\n" t))))
					(erc :nick (car user-info) :password (nth 1 user-info)))
			(let ((user-name (read-string "ERC Nick: "))
						(user-password (read-passwd "ERC Password: "))
						save-y-or-n)
				(if (or (string= user-name "")
								(string= user-password ""))
						(error "The user name or password can't be null!")
					(setq save-y-or-n (read-minibuffer
														 "Do you want to save your ERC user info?(y/n)"
														 "y"))
					(when (string= save-y-or-n "y")
						(with-temp-file erc-file-path
							(insert (format "%s\n" user-name))
							(insert (format "%s" user-password))))
					(erc :nick user-name :password user-password))))))

(defun kiteab/downcase-word-first-letter ()
	"Downcase the first letter in the word at point."
	(interactive)
	(let ((letter (cl-subseq (thing-at-point 'word t) 0 1)))
		(delete-char 1)
		(insert (downcase letter))))

(defun kiteab/add-todo-in-code ()
	"Add todo content in code."
	(interactive)
	(comment-dwim 2)
	(insert "<TODO(KiteAB)> "))

(defun kiteab/find-file (&optional dir)
	"Search file use fuzzy file finder"
	(interactive "DInput the directory: ")
	(counsel-fzf nil dir))

(defun kiteab/kill-magit (&optional dir)
	"Kill the buffer about Magit"
	(interactive "sInput the directory of Git repository: ")
	(magit-mode-bury-buffer)
	(unless (null (magit-mode-get-buffers))
		(dolist (buffer (magit-mode-get-buffers))
			(kill-buffer buffer))))

(defun kiteab/kill-unwanted-buffers ()
	"Kill unwanted buffers for me."
	(interactive)
	(progn
		(kill-buffer "tasks.org")
		(kill-buffer "*Help*")
		(kill-buffer "*Backtrace*")))

(defun kiteab/search-engine ()
	"Open search page by eaf-browser."
	(interactive "MThe text you want to search: ")
	(eaf-open-browser (concat "https://cn.bing.com/search?q=" content)))

(provide 'init-functions)
