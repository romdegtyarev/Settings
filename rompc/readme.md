# Система:  
Ubuntu 18.04.4 LTS x86_64  

# Before start:  

# Start:  
sudo apt-get update  
sudo apt-get upgrade  

### Настройка языка:  

### Настройка локали:  

### Настройка времени:  
sudo apt-get install ntpdate  
sudo apt-get install ntp  

### Настройка имени хост машины:  

### Настройка пароля root'a:  

### Настройка загрузчика grub:  

### Настройка networkmanager:  

### Reboot:  

### Настройка пользователя:  
adduser username_1  
usermod -aG sudo username_1  
adduser username_2  
usermod -aG sudo username_2  

### Установка и настройка основных пакетов:  
sudo apt-get install curl  
sudo apt-get install openssh  
sudo apt-get install sshfs  
sudo apt-get install sshpass  
systemctl start sshd.service  
systemctl enable sshd.service  
ssh-keygen  
sudo apt-get install fail2ban  
  
sudo apt-get install git  
sudo apt-get install vim  
sudo apt-get install zsh  
*Сменить bash на zsh в /etc/passwd*  
sudo apt-get install tmux  
sudo apt-get install xclip  
sudo apt-get install htop  
  
sudo apt-get install net-tools  
sudo apt-get install wireguard  
*Настройка wg*  
sudo apt-get install resolvconf  

### Настройка хранилища:  
chmod -R 777 /local/store/  
chown -R username_1:username_1 /local/store/  
cd /local/store/  
mkdir git  

### Настройка YAY:  

### Настройка OH-MY-ZSH:  
cd  
curl -L http://install.ohmyz.sh | sh  
cd /usr/share/  
sudo mkdir oh-my-zsh  
cd  
cd .oh-my-zsh  
sudo cp -r ./ /usr/share/oh-my-zsh/  
*Темы и плагины*  

### Настройка github:  
mkdir -p /local/store/git/  
cd /local/store/git/  
git clone https://github.com/romdegtyarev/Settings.git  
cd ./Settings/  
./install_my_settings.sh  

### Настройка SAMBA:  
pacman -S samba  
cd /  
sudo mkdir -p /samba/private  
sudo chgrp users /samba/private  
sudo smbpasswd -a user1  
systemctl start smb.service  
systemctl enable smb.service  
  
iptables -A INPUT -p tcp -m tcp --dport 445 –s 10.0.0.0/24 -j ACCEPT  
iptables -A INPUT -p tcp -m tcp --dport 139 –s 10.0.0.0/24 -j ACCEPT  
iptables -A INPUT -p udp -m udp --dport 137 –s 10.0.0.0/24 -j ACCEPT  
iptables -A INPUT -p udp -m udp --dport 138 –s 10.0.0.0/24 -j ACCEPT  
pacman -S iptables-persistent  
iptables -L  

### Настройка GUI:  
sudo apt-get install i3-wm  
sudo apt-get install i3blocks  
sudo apt-get install i3status  
sudo apt-get install i3lock-fancy  
*Папка с настройками xorg /etc/X11/xorg.conf.d/*  
  
sudo apt-get install rofi  
sudo apt-get install dmenu  
sudo apt-get install j4-dmenu-desktop  
sudo apt-get install compton  
sudo apt-get install feh  
  
sudo apt-get install pavucontrol  
*Скрипт установки или*  
*sudo apt-get install pamixer*  
  
sudo apt-get install fonts-font-awesome  
sudo apt-get install fonts-powerline  
sudo apt-get install fonts-hack  
sudo apt-get install fonts-hack-otf  
sudo apt-get install fonts-hack-ttf  
sudo apt-get install fonts-hack-web  
sudo apt-get install fonts-cantarell  
  
sudo apt-get install neofetch  
sudo apt-get install sl  
sudo apt-get install scrot  
*Скрипт установки или*  
*sudo apt-get install xxkb*  
sudo apt-get install pcmanfm  
sudo add-apt-repository ppa:h-realh/roxterm  
sudo apt-get update  
sudo apt-get install roxterm  
sudo apt-get install keepassxc  

### Настройка soft'a:  
sudo apt-get install unrar  
sudo apt-get install docker  
usermod -aG docker username_1  
  
sudo apt-get install lm-sensors  
  
sudo apt-get install vlc  
sudo apt-get install pinta  
sudo apt-get install simplescreenrecorder  
  
sudo apt-get install gedit-plugins  
sudo apt-get install libreoffice  
  
sudo snap install telegram-desktop  
sudo dpkg -i ./discord-0.0.27.deb  
sudo apt-get install thunderbird  
  
*Eclipse Установщик*  
sudo apt-get install meld  
sudo apt-get install wireshark-qt  
sudo chmod 755 /usr/bin/dumpcap  
  
sudo apt-get install golang  
sudo apt-get install python  
sudo apt-get install python3  
sudo apt-get install python3-pip  
sudo apt-get install python3-venv  
sudo apt-get install mesa-vulkan-drivers  
sudo apt-get install vulkan-utils  
sudo apt-get install dh-autoreconf  

### Настройка пакетов для работы:  
sudo apt-get install virtualbox  
sudo apt-get install minicom  
sudo apt-get install tcpreplay  
sudo apt-get install memstat  
  
sudo apt-get install freeradius  
sudo apt-get install tacacs+  
sudo apt-get install snmp  
sudo apt-get install python-scapy  
sudo apt-get install tftpd  
sudo apt-get install tftp  
sudo apt-get install nfs-kernel-server  
sudo apt-get install nginx  
  
sudo apt-get install pidgin  
*Mattermost Установщик*  
  
sudo apt-get install libc6-i386  
sudo apt-get install lib32stdc++6  
sudo apt-get install lib32gcc1  
sudo apt-get install lib32ncurses5 *lib32ncurses6*  
sudo apt-get install lib32z1  
sudo apt-get install xinetd *Для fttp*  
sudo apt-get install jacksum  
sudo apt-get install dos2unix  
sudo apt-get install u-boot-tools  
sudo apt-get install m4  
sudo usermod -a -G dialout ${USER}  
sudo apt-get install wine1.6  
sudo apt-get install bison  
sudo apt-get install flex  
sudo apt-get install gcc-mingw-w64  
sudo apt-get install gcc-6-i686-linux-gnu  
sudo apt-get install mingw-w64-tools  
sudo apt-get install device-tree-compiler  
sudo apt install locales-all  
sudo apt install libssl1.0-dev  
*sudo apt-get install node-fs.realpath*  
*sudo apt-get install libssl-dev*  

#### RDP  
sudo apt-get install xrdp  
sudo apt-get install xorgxrdp-hwe-18.04  
*Добавить строчки в файл /etc/xrdp/startwm.sh:*  
  
*#test -x /etc/X11/Xsession && exec /etc/X11/Xsession*  
*#exec /bin/sh /etc/X11/Xsession*  
  
*unset DBUS_SESSION_BUS_ADDRESS*  
*#exec gnome-session*  
*exec i3-gnome*  
  
*Возможные ошибки:*  
*https://tokmakov.msk.ru/blog/item/454*  
*http://c-nergy.be/blog/?p=14888*  
  

#### TFTP:  
*Отредактировать /etc/xinetd.d/tftp:*  
  
*service tftp*  
*{*  
*protocol = udp*  
*port = 69*  
*socket_type = dgram*  
*wait = yes*  
*user = nobody*  
*server = /usr/sbin/in.tftpd*  
*server_args = /var/tftpboot*  
*disable = no*  
*}*  
  
*Создать каталог /var/tftpboot:*  
sudo mkdir -p /var/tftpboot  
sudo chmod -R 777 /var/tftpboot  

#### NFS:  
*Создать каталог /var/nfs:*  
sudo mkdir -p /var/nfs  
sudo chmod -R 777 /var/nfs  
  
*Отредактировать /etc/exports, добавив строку:*  
  
*/var/nfs *(rw,sync,insecure_locks,no_root_squash,no_subtree_check)*  
  
sudo service nfs-kernel-server restart  

#### TimeLogger  
*Скрипт установки*  


