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
ln -s ~/local/store/git/Settings/common/vim/vimrc ~/.vimrc
sudo cp /local/store/git/Settings/common/ssh/ssh_config /etc/ssh/ssh_config
# See common/ssh/help.txt


