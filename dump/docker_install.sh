#Installation refference: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# if docker is to be seted up on a remote host without any GUI setup gnome terminal

sudo apt install gnome-terminal

#ensure cleaning any previous installation
sudo apt remove docker-desktop

rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop


#install docker and dependency
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#verifiy installation
 sudo service docker start


#test installation
 sudo docker run hello-world


