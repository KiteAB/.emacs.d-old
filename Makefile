install:
	cd ${HOME}
	mv .emacs.d .emacs.d-bak
	git clone https://github.com/KiteAB/.emacs.d .emacs.d
	cd .emacs.d
	mkdir site-lisp gtd
  ln bookmarks var/bookmarks
  git clone https://github.com/manateelazycat/emacs-application-framework site-lisp/emacs-application-framework --depth=1
  git clone https://github.com/loyalpartner/english-teacher.el site-lisp/english-teacher.el --depth=1
  git clone https://github.com/jwiegley/use-package site-lisp/use-package --depth=1
  git clone https://github.com/manateelazycat/company-english-helper site-lisp/company-english-helper --depth=1
	echo "Installed."

uninstall:
	cd ${HOME}
	mv .emacs.d .emacs.d-ab
	mv .emacs.d-bak .emacs.d
	echo "Uninstalled."
