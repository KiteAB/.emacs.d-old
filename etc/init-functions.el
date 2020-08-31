;;;; This file is used for the useful functions
(defun open-config-file ()
	"Open the init.el file."
	(interactive)
	(find-file "~/.emacs.d/init.el"))

(defun open-etc-config (file)
	"Open the config file in the etc directory."
	(interactive (list (completing-read "Enter the filename: "
																 '("ui" "org" "keymap" "mode"
																	 "package" "packages" "function"))))
	(pcase file
		("ui" (find-file "~/.emacs.d/etc/init-ui.el"))
		("org" (find-file "~/.emacs.d/etc/init-org.el"))
		("keymap" (find-file "~/.emacs.d/etc/init-keymaps.el"))
		("mode" (find-file "~/.emacs.d/etc/init-modes.el"))
		("packages" (find-file "~/.emacs.d/etc/init-package.el"))
		("function" (find-file "~/.emacs.d/etc/init-functions.el"))))

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
																 '("emacs" "git" "gtd" "c"))))
	(pcase dir-name
		("gtd" (find-file "~/.emacs.d/gtd"))
		("git" (find-file "~/Github"))
		("emacs" (find-file "~/.emacs.d"))
		("cpp" (find-file "~/cpp/src"))))

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

(defun write-scratch ()
	"Open the write scratch buffer."
	(interactive)
	(switch-to-buffer "*Write-Scratch*")
	(markdown-mode))

(defun markdown-table-keymap ()
	"Add table map in markdown mode."
	(interactive)
	(define-key markdown-mode-map (kbd "C-c C-c TAB") 'markdown-table-align))

(defun day-or-night ()
	"Return t/nil.
If it's daytime now,return t.Otherwise return nil."
	(let ((now-time
				 (string-to-number (cl-subseq (current-time-string) 11 13))))
		(if (and (>= now-time 8) (< now-time 18))
				t
			nil)))

(defun load-the-theme ()
	"Load the theme by time."
	(interactive)
	(if (day-or-night)
			(progn
				(package-require
				 'atom-one-light
				 :outside
				 :before-load-eval '(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
				 :load-theme 'atom-one-light)
				(when (string= kiteab/time-block "night")
					(eaf-browser-set))
				(setq kiteab/time-block "daytime"))
		(package-require
		 'atom-one-dark
		 :outside
		 :before-load-eval '(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
		 :load-theme 'atom-one-dark)
		(when (string= kiteab/time-block "daytime")
			(eaf-browser-set))
		(setq kiteab/time-block "night"))
	(if (day-or-night)
	    (set-cursor-color "black")
	  (set-cursor-color "white")))

(defun kill-unwanted-buffer ()
	"Kill the unwanted buffers."
	(interactive)
	(kill-buffer "*dashboard*")
	(kill-buffer "notes.org")
	(kill-buffer "tasks.org")
	(when (get-buffer "user-init.el")
		(kill-buffer "user-init.el")))

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
	(insert initial-scratch-message)
	(message "Open the scratch action done."))

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

(provide 'init-functions)
