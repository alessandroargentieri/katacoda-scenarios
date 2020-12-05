#! /bin/bash

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
snap install kubectl --classic
snap install figlet
echo "alias clusterinit='k3d cluster create'" >> .bashrc
echo "alias login='figlet Codemotion Cloud'" >> .bashrc
figlet "Ciao"


echo "       _                 _         "
echo " _   _| |__  _   _ _ __ | |_ _   _ "
echo "| | | | '_ \| | | | '_ \| __| | | |"
echo "| |_| | |_) | |_| | | | | |_| |_| |"
echo " \__,_|_.__/ \__,_|_| |_|\__|\__,_|"
