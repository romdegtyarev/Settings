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
ln -s /local/store/git/Settings/common/i3/config ~/.config/i3/config
ln -s /local/store/git/Settings/common/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo ln -s /local/store/git/Settings/common/i3/i3blocks /usr/lib/i3blocks

# X11, GTK
ln -s /local/store/git/Settings/common/X11/xinitrc ~/.xinitrc
sudo ln -s /local/store/git/Settings/common/X11/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
sudo ln -s /local/store/git/Settings/common/X11/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf

ln -s /local/store/git/Settings/common/gtkrc-2.0 ~/.gtkrc-2.0
ln -s /local/store/git/Settings/common/gtk-bookmarks ~/.gtk-bookmarks

ln -s /local/store/git/Settings/common/gtk-2.0 ~/.config/gtk-2.0
ln -s /local/store/git/Settings/common/gtk-3.0 ~/.config/gtk-3.0
ln -s /local/store/git/Settings/common/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s /local/store/git/Settings/common/user-dirs.locale ~/.config/user-dirs.locale

sudo ln -s /local/store/git/Settings/common/gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -s /local/store/git/Settings/common/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini

# Fonts
ln -s /local/store/git/Settings/common/fonts ~/.fonts

# roxterm
ln -s /local/store/git/Settings/common/roxterm/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net

# pcmanfm
ln -s /local/store/git/Settings/common/libfm ~/.config/libfm
ln -s /local/store/git/Settings/common/pcmanfm ~/.config/pcmanfm

# Apps
sudo cp /local/store/git/Settings/common/ssh/sshd_config /etc/ssh/sshd_config
sudo cp /local/store/git/Settings/common/ssh/ssh_config /etc/ssh/ssh_config
# See common/ssh/help.txt
ln -s /local/store/git/Settings/common/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/vim/vimrc ~/.vimrc
sudo ln -s /local/store/git/Settings/common/smb.conf /etc/samba/smb.conf
sudo ln -s /local/store/git/Settings/common/pacman.conf /etc/pacman.conf
ln -s /local/store/git/Settings/common/rofi ~/.config/rofi

sudo ln -s /local/store/git/Settings/homeserver/minidlna.conf /etc/minidlna.conf
ln -s /local/store/git/Settings/homeserver/scripts/start_stop.sh ~/start_stop.sh

# For root
sudo ln -s /local/store/git/Settings/common/zsh/bashrc /root/.bashrc
sudo ln -s /local/store/git/Settings/common/vim/vimrc /root/.vimrc
sudo ln -s /local/store/git/Settings/common/zsh/zshrc_root /root/.zshrc


