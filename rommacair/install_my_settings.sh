#!/bin/bash

# zsh
ln -s ~/git/Settings/common/zsh/bashrc ~/.bashrc
ln -s ~/git/Settings/rommacair/zsh/zshrc ~/.zshrc
# Copy themes and plugins
cp -r ~/git/Settings/common/zsh/themes/* ~/.oh-my-zsh/themes/
cp -r ~/git/Settings/common/zsh/plugins/* ~/.oh-my-zsh/custom/plugins/

# tmux
ln -s ~/git/Settings/rommacair/tmux/tmux.conf ~/.tmux.conf

# Apps
#SSH
sudo cp ~/git/Settings/common/ssh/ssh_config /etc/ssh/ssh_config
# See common/ssh/help.txt

ssh-keygen -t ed25519
ssh-keygen -t rsa -b 4096

ln -s ~/git/Settings/common/gitconfig ~/.gitconfig
ln -s ~/git/Settings/common/vim/vimrc ~/.vimrc


