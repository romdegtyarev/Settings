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
ln -s /local/store/git/Settings/rompc/i3/config ~/.config/i3/config
ln -s /local/store/git/Settings/rompc/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo ln -s /local/store/git/Settings/rompc/i3/i3blocks /usr/lib/i3blocks

# X11, GTK
ln -s /local/store/git/Settings/common/X11/xinitrc ~/.xinitrc
sudo ln -s /local/store/git/Settings/common/X11/keyboard /etc/default/keyboard

ln -s /local/store/git/Settings/rompc/scripts/xmodmap.sh ./xmodmap.sh 

ln -s /local/store/git/Settings/rompc/gtkrc-2.0 ~/.gtkrc-2.0

ln -s /local/store/git/Settings/rompc/gtk-2.0 ~/.config/gtk-2.0
ln -s /local/store/git/Settings/rompc/gtk-3.0 ~/.config/gtk-3.0
ln -s /local/store/git/Settings/common/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s /local/store/git/Settings/common/user-dirs.locale ~/.config/user-dirs.locale

ln -s /local/store/git/Settings/common/fonts ~/.fonts

# roxterm
ln -s /local/store/git/Settings/common/roxterm/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net

# pcmanfm
ln -s /local/store/git/Settings/rompc/libfm ~/.config/libfm
ln -s /local/store/git/Settings/rompc/pcmanfm ~/.config/pcmanfm

# Apps
sudo ln -s /local/store/git/Settings/common/ssh/sshd_config /etc/ssh/sshd_config
ln -s /local/store/git/Settings/rompc/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/vim/vimrc ~/.vimrc
sudo ln -s /local/store/git/Settings/common/smb.conf /etc/samba/smb.conf
ln -s /local/store/git/Settings/common/Pinta ~/.config/Pinta
ln -s /local/store/git/Settings/common/rofi ~/.config/rofi
ln -s /local/store/git/Settings/common/keepassxc ~/.config/keepassxc
ln -s /local/store/git/Settings/rompc/minirc.dfl ~/.minirc.dfl

# For root
sudo ln -s /local/store/git/Settings/common/zsh/bashrc /root/.bashrc
sudo ln -s /local/store/git/Settings/common/vim/vimrc /root/.vimrc
sudo ln -s /local/store/git/Settings/common/zsh/zshrc_root /root/.zshrc


