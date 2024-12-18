#!/bin/bash

# zsh
ln -s ~/local/store/git/Settings/common/zsh/bashrc ~/.bashrc
ln -s ~/local/store/git/Settings/rommacair/zsh/zshrc ~/.zshrc
# Copy themes and plugins
cp -r ~/local/store/git/Settings/common/zsh/themes/* ~/.oh-my-zsh/themes/
cp -r ~/local/store/git/Settings/common/zsh/plugins/* ~/.oh-my-zsh/custom/plugins/

# tmux
ln -s ~/local/store/git/Settings/rommacair/tmux/tmux.conf ~/.tmux.conf

# Apps
ln -s ~/local/store/git/Settings/common/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/gitconfig ~/.gitignoreglobal
git config --global core.excludesfile ~/.gitignoreglobal
ln -s ~/local/store/git/Settings/common/vim/vimrc ~/.vimrc
sudo cp /local/store/git/Settings/common/ssh/ssh_config /etc/ssh/ssh_config
# See common/ssh/help.txt
ssh-keygen -G /tmp/moduli -b 4096
sudo ssh-keygen -T /etc/ssh/moduli -f /tmp/moduli

ssh-keygen -M generate -O bits=4096 /tmp/moduli
sudo ssh-keygen -M screen -f /tmp/moduli /etc/ssh/moduli

cd /etc/ssh
sudo rm ssh_host_ecdsa_key*
sudo rm ssh_host_key*
sudo ln -s ssh_host_ecdsa_key ssh_host_ecdsa_key
sudo ln -s ssh_host_key ssh_host_key

cd /etc/ssh
sudo rm ssh_host_dsa_key*
sudo ln -s ssh_host_dsa_key ssh_host_dsa_key

cd /etc/ssh
sudo rm ssh_host_rsa_key*
sudo ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key < /dev/null

ssh-keygen -t ed25519
ssh-keygen -t rsa -b 4096



