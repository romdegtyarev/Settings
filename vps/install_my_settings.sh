#!/bin/bash

# zsh
ln -s /local/store/git/Settings/common/zsh/bashrc ~/.bashrc
ln -s /local/store/git/Settings/common/zsh/zshrc ~/.zshrc
# Copy themes and plugins
sudo cp -r /local/store/git/Settings/common/zsh/themes/* /usr/share/oh-my-zsh/themes/
sudo cp -r /local/store/git/Settings/common/zsh/plugins/* /usr/share/oh-my-zsh/custom/plugins/

# tmux
ln -s /local/store/git/Settings/common/tmux/tmux.conf ~/.tmux.conf

# Apps
sudo ln -s /local/store/git/Settings/common/ssh/sshd_config /etc/ssh/sshd_config
ln -s /local/store/git/Settings/common/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/vim/vimrc ~/.vimrc

# For root
sudo ln -s /local/store/git/Settings/common/zsh/bashrc /root/.bashrc
sudo ln -s /local/store/git/Settings/common/vim/vimrc /root/.vimrc
sudo ln -s /local/store/git/Settings/common/zsh/zshrc_root /root/.zshrc


