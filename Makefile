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
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install -y git
	sudo apt-get install -y make
	sudo apt-get install -y autoconf
	sudo apt-get install -y g++
	sudo apt-get install -y flex
	sudo apt-get install -y bison
	sudo apt-get install -y vim 
	sudo apt-get install -y vim-gnome 
	sudo apt-get install -y terminator 
	sudo apt-get install -y vlc 
	sudo apt install -y libgnome2-bin
	sudo apt-get install spotify-client
	git clone --single-branch -b stable http://git.veripool.org/git/verilator
	unset VERILATOR_ROOT 
	cd verilator
	git pull      
	git tag      
	autoreconf -i configure.ac      
	./configure
	make
	sudo make install
	cd ..
	rm -rf verilator
all :	apps bashrc vimrc background gitdetails setuplabmachines latexstuff
