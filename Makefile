install:
	cd ${HOME}
	mv .emacs.d .emacs.d-bak
	git clone https://github.com/KiteAB/.emacs.d .emacs.d
	cd .emacs.d
	mkdir third-party gtd
  ln bookmarks var/bookmarks
  git clone https://github.com/manateelazycat/emacs-application-framework third-party/emacs-application-framework --depth=1
  git clone https://github.com/loyalpartner/english-teacher.el third-party/english-teacher.el --depth=1
  git clone https://github.com/SpringHan/netease-cloud-music.el third-party/netease-cloud-music.el --depth=1
  git clone https://github.com/jwiegley/use-package third-party/use-package --depth=1
	echo "Installed."

uninstall:
	cd ${HOME}
	mv .emacs.d .emacs.d-ab
	mv .emacs.d-bak .emacs.d
	echo "Uninstalled."
