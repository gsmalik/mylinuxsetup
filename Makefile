packages:
	sudo apt-get install vim
	sudo apt-get install vim-gnome
bashrc:
	cp -rf .bashrc ${HOME}/
vimrc:
	cp -rf .vim ${HOME}/
	cp -rf .vimrc ${HOME}/
background:
	gsettings set org.gnome.desktop.background picture-uri 'file://${PWD}/mywallpaper.jpg'
all : bashrc vimrc background
