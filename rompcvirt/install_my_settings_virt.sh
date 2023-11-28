#!/bin/bash

# zsh
ln -s /local/store/git/Settings/common/zsh/bashrc ~/.bashrc
ln -s /local/store/git/Settings/common/zsh/zshrc ~/.zshrc
# Copy themes and plugins
sudo cp -r /local/store/git/Settings/common/zsh/themes/* /usr/share/oh-my-zsh/themes/
sudo cp -r /local/store/git/Settings/common/zsh/plugins/* /usr/share/oh-my-zsh/custom/plugins/

# tmux
ln -s /local/store/git/Settings/common/tmux/tmux.conf ~/.tmux.conf

# i3wm
ln -s /local/store/git/Settings/rompcvirt/i3/config ~/.config/i3/config
ln -s /local/store/git/Settings/rompcvirt/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo ln -s /local/store/git/Settings/common/i3/i3blocks /usr/lib/i3blocks
# Theme install

# X11, GTK
sudo ln -s /local/store/git/Settings/common/X11/keyboard /etc/default/keyboard
ln -s /local/store/git/Settings/rompcvirt/scripts/xmodmap.sh ~/xmodmap.sh

ln -s /local/store/git/Settings/rompcvirt/gtk-3.0/bookmarks ~/.config/gtk-3.0/bookmarks
ooщln -s /local/store/git/Settings/common/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s /local/store/git/Settings/common/user-dirs.locale ~/.config/user-dirs.locale

# Fonts
ln -s /local/store/git/Settings/common/fonts ~/.fonts

# roxterm
ln -s /local/store/git/Settings/common/roxterm/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net

# pcmanfm
ln -s /local/store/git/Settings/rompcvirt/libfm ~/.config/libfm
ln -s /local/store/git/Settings/rompcvirt/pcmanfm ~/.config/pcmanfm

# Apps
ln -s /local/store/git/Settings/rompcvirt/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/vim/vimrc ~/.vimrc
ln -s /local/store/git/Settings/common/rofi ~/.config/rofi

# For root
sudo ln -s /local/store/git/Settings/common/zsh/bashrc /root/.bashrc
sudo ln -s /local/store/git/Settings/common/vim/vimrc /root/.vimrc
sudo ln -s /local/store/git/Settings/common/zsh/zshrc_root /root/.zshrc

