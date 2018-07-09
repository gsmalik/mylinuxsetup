gitdetails:
	ssh-keygen -t rsa
	git config --global user.email gsmalik@uwaterloo.ca
	git config --global user.name gsmalik

bashrc:
	cp -rf .bashrc ${HOME}/
vimrc:
	cp -rf .vim ${HOME}/
	cp -rf .vimrc ${HOME}/
background:
	gsettings set org.gnome.desktop.background picture-uri 'file://${PWD}/mywallpaper.jpg'
apps:
	sudo apt-get update
	sudo apt-get install -y vim 
	sudo apt-get install -y vim-gnome 
	sudo apt-get install -y terminator 
	sudo apt-get install -y vlc 
all :	apps bashrc vimrc background gitdetails
