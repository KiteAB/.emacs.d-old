# This is a makefile to initialize the emacs configuration

install:
	mkdir ~/.emacs.d/third-party
	git clone https://github.com/loyalpartner/english-teacher.el ~/.emacs.d/third-party/english-teacher.el --depth=1
	@echo "English-teacher.el downloaded"
	git clone https://github.com/SpringHan/netease-cloud-music.el ~/.emacs.d/third-party/netease-cloud-music.el --depth=1
	@echo "Netease-Cloud-Music downloaded"
	mkdir ~/.emacs.d/var
	ln -sf ~/.emacs.d/bookmarks ~/.emacs.d/var/bookmarks
	mkdir ~/.emacs.d/var/netease-cloud-music/
	ln -sf ~/.emacs.d/playlist.txt ~/.emacs.d/var/netease-cloud-music/
	@echo "Make successful"
