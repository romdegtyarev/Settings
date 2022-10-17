#!/bin/bash

# zsh
ln -s ~/local/store/git/Settings/common/zsh/bashrc ~/.bashrc
ln -s ~/local/store/git/Settings/rommacair/zsh/zshrc ~/.zshrc
# Copy themes and plugins
cp -r ~/local/store/git/Settings/common/zsh/themes/* ~/.oh-my-zsh/themes/
cp -r ~/local/store/git/Settings/common/zsh/plugins/* ~/.oh-my-zsh/custom/plugins/

# tmux
ln -s ~/local/store/git/Settings/common/tmux/tmux.conf ~/.tmux.conf

ln -s ~/local/store/git/Settings/common/fonts ~/.fonts

# Apps
sudo ln -s ~/local/store/git/Settings/rommacair/ssh/sshd_config /etc/ssh/sshd_config
ln -s ~/local/store/git/Settings/common/gitconfig ~/.gitconfig
ln -s ~/local/store/git/Settings/common/vim/vimrc ~/.vimrc


