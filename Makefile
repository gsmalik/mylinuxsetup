latexstuff:
	sudo add-apt-repository  -y ppa:jonathonf/texlive
	sudo apt update 
	sudo apt install -y texlive-full
	sudo apt-get install -y python-pygments
setuplabmachines:
	sudo apt-get install -y openssh-server 
	sudo service ssh restart
	ssh-copy-id gsmalik@jane.uwaterloo.ca
	ssh-copy-id gsmalik@hex.uwaterloo.ca
	ssh-copy-id gsmalik@deathstar.eng.uwaterloo.ca
	ssh-copy-id gsmalik@agamemnon.eng.uwaterloo.ca

gitdetails:
	sudo apt-get install git
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
	sudo apt install -y libgnome2-bin
all :	apps bashrc vimrc background gitdetails setuplabmachines latexstuff
