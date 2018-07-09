bashrc:
	cp -rf .bashrc ${HOME}/
vimrc:
	cp -rf .vim ${HOME}/
	cp -rf .vimrc ${HOME}/
background:
	gsettings set org.gnome.desktop.background picture-uri 'file://${PWD}/mywallpaper.jpg'
apps:
	sudo apt-get update
	sudo apt-get install vim vim-gnome terminator vlc texlive-full
all : 
	apps
	bashrc 
	vimrc 
	background
