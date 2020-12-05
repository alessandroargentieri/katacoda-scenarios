#! /bin/bash

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
snap install kubectl --classic
snap install figlet
echo "alias clusterinit='k3d cluster create'" >> .bashrc
