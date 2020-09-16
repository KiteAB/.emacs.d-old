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

(defun open-etc-config-by-char (char)
	"Call the open-etc-config with its index."
	(interactive "cEnter the char: ")
	(open-etc-config (pcase char
										 (115 "settings")
										 (108 "languages"))))

(defun open-vterm (&optional dir)
	"Open the vterm by DIR"
	(interactive "DInput the directory: ")
	(find-file dir)
	(let ((current-buffer-name (buffer-name)))
		(vterm)
		(linum-mode -1)
		(kill-buffer current-buffer-name)))

(defun open-the-dir (dir-name)
	"Open some directory by the DIR-NAME."
	(interactive (list
								(completing-read "The directory's name: "
																 '("emacs" "git" "gtd" "c" "script"))))
	(pcase dir-name
		("gtd" (find-file "~/.emacs.d/gtd"))
		("git" (find-file "~/Github"))
		("emacs" (find-file "~/.emacs.d"))
		("cpp" (find-file "~/cpp/src"))
		("script" (find-file "~/scripts"))))

(defun set-alpha (var)
	"Set the backgroud alpha by VAR."
	(interactive "sAlpha or not(y-or-n): ")
	(pcase var
		("y" (set-frame-parameter nil 'alpha '(90 . 100)))
		("n" (set-frame-parameter nil 'alpha '(100 . 100)))))

(defun window-move (way)
	"Move the buffer window position by WAY."
	(interactive "sEnter the way(n-e-u-i): ")
	(let ((current-window-buffer (window-buffer))
				(current-window (get-buffer-window)))
		(pcase way
			("n" (windmove-left))
			("e" (windmove-down))
			("u" (windmove-up))
			("i" (windmove-right)))
		(setq another-window-buffer (get-buffer-window))
		(if (not (eql current-window-buffer another-window-buffer))
				(progn
					(set-window-buffer current-window (window-buffer))
					(set-window-buffer (get-buffer-window) current-window-buffer))))) ; Move the window

(defun sudo-save ()
	"Save the current buffer file with sudo."
	(interactive)
	(if (not buffer-file-name)
			(write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
		(write-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun markdown-table-keymap ()
	"Add table map in markdown mode."
	(interactive)
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

(defun kiteab/scratch-erase-contents ()
	"Erase all the contents of *scratch* buffer."
	(interactive)
	(with-current-buffer "*scratch*"
		(let ((content	(buffer-string)))
			(unless (string= content initial-scratch-message)
				(erase-buffer)
				(insert initial-scratch-message)
				(message "Erased contents in *scratch* buffer.")
				(end-of-buffer)))))

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
	"Clear the buffer about Magit"
	(interactive "sInput the directory of Git repository: ")
	(progn
		(if (gnus-buffer-exists-p (format "magit: %s" dir))
				(kill-buffer (format "magit: %s" dir)))
		(if (gnus-buffer-exists-p (format "magit-process: %s" dir))
				(kill-buffer (format "magit-process: %s" dir)))
		(if (gnus-buffer-exists-p (format "magit-diff: %s" dir))
				(kill-buffer (format "magit-diff: %s" dir)))
		(if (gnus-buffer-exists-p "*Backtrace*")
				(kill-buffer "*Backtrace*"))
		(delete-window nil)))

(defun kiteab/kill-help-buffer ()
	"If buffer is *Help*, kill it and kill the window, Otherwise just kill current buffer."
	(interactive)
	(if ((equal buffer-file-name "*Help*"))
			(progn
				(kill-buffer "*Help*")
				(delete-window))
		(kill-buffer)))

(provide 'init-functions)
