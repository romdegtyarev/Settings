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
ln -s /local/store/git/Settings/rompc/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo ln -s /local/store/git/Settings/common/i3/i3blocks /usr/lib/i3blocks
# Theme install

# X11, GTK
ln -s /local/store/git/Settings/common/X11/xinitrc ~/.xinitrc
sudo ln -s /local/store/git/Settings/common/X11/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
sudo ln -s /local/store/git/Settings/common/X11/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf

ln -s /local/store/git/Settings/rompc/scripts/xmodmap.sh ~/xmodmap.sh

ln -s /local/store/git/Settings/common/gtk-bookmarks ~/.gtk-bookmarks

ln -s /local/store/git/Settings/common/gtk-2.0 ~/.config/gtk-2.0
ln -s /local/store/git/Settings/rompc/gtk-3.0/bookmarks ~/.config/gtk-3.0/bookmarks
ln -s /local/store/git/Settings/common/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s /local/store/git/Settings/common/user-dirs.locale ~/.config/user-dirs.locale

# Fonts
ln -s /local/store/git/Settings/common/fonts ~/.fonts

# roxterm
ln -s /local/store/git/Settings/common/roxterm/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net

# pcmanfm
ln -s /local/store/git/Settings/common/libfm ~/.config/libfm
ln -s /local/store/git/Settings/common/pcmanfm ~/.config/pcmanfm

# Apps
#SSH
sudo cp /local/store/git/Settings/common/ssh/sshd_config /etc/ssh/sshd_config
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


ln -s /local/store/git/Settings/rompc/gitconfig ~/.gitconfig
ln -s /local/store/git/Settings/common/vim/vimrc ~/.vimrc
sudo ln -s /local/store/git/Settings/common/pacman.conf /etc/pacman.conf
ln -s /local/store/git/Settings/common/Pinta ~/.config/Pinta
ln -s /local/store/git/Settings/common/rofi ~/.config/rofi
ln -s /local/store/git/Settings/common/keepassxc ~/.config/keepassxc
ln -s /local/store/git/Settings/rompc/minirc.dfl ~/.minirc.dfl

#Add i3 scripts
sudo cp /local/store/git/system_info_daemon.service /etc/systemd/system/
sudo cp /local/store/git/system_info_daemon.sh /usr/local/bin/
sudo systemctl start system_info_daemon.service
sudo systemctl enable system_info_daemon.service

# For root
sudo ln -s /local/store/git/Settings/common/zsh/bashrc /root/.bashrc
sudo ln -s /local/store/git/Settings/common/vim/vimrc /root/.vimrc
sudo ln -s /local/store/git/Settings/common/zsh/zshrc_root /root/.zshrc


