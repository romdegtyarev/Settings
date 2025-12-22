# Система:  
Arch Linux x86_64  

# Before start:  
1. Загружаемся с загрузочной флешки  

2. Создаем разделы:  
parted /dev/sda  
*Для просмотра текущих разделов можно использовать команду:*  
print  

3. Задаем partition table для диска:  
*Для BIOS с MBR:*  
mklabel msdos  
*Разделы: swap, /home, /local/store, /:*  
mkpart primary linux-swap 1049kiB 16.4GiB  
mkpart primary ext4 16.4GiB 119GiB  
mkpart primary ext4 119GiB 631GiB  
mkpart primary ext4 631GiB 100%  
quit  

4. Форматируем разделы:  
mkswap /dev/sda1  
mkfs.ext4 /dev/sda5  
mkfs.ext4 /dev/sda6  
mkfs.ext4 /dev/sda7  

5. Монтируем разделы:  
mount /dev/sda7 /mnt  
mkdir -p /mnt/local/store  
mount /dev/sda5 /mnt/home/  
mount /dev/sda6 /mnt/local/store  
swapon /dev/sda1  

6. Устанавливаем Linux  
pacman -Syy  
pacman -S archlinux-keyring  
pacman-key --init  
pacman-key --populate archlinux  
pacman-key --refresh-key  
pacman-key --keyserver hkp://pgp.mit.edu --refresh-key  
*[Информация о серверах](https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D0%B2%D0%B5%D1%80_%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D1%85_%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%B9)*  
pacstrap -i /mnt base  
pacstrap -i /mnt linux  
pacstrap -i /mnt linux-firmware  
pacstrap -i /mnt base-devel  
genfstab -U -p /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  

# Start:  
pacman -Syy  
pacman -S archlinux-keyring  
pacman-key --init  
pacman-key --populate archlinux  
pacman-key --refresh-key  
pacman-key --keyserver hkp://pgp.mit.edu --refresh-key  

### Настройка языка:  
*Редактируем файл /etc/locale.gen (расскоментировав следующие строки):*  
>en_US.UTF-8 UTF-8  
ru_RU.UTF-8 UTF-8  
  
*Запускаем сборку:*  
locale-gen  

### Настройка локали:  
echo LANG=en_US.UTF-8 > /etc/locale.conf  
export LANG=en_US.UTF-8  
  
*Редактируем файл /etc/vconsole.conf (добавив следующие строки):*  
>KEYMAP=ru  
FONT=cyr-sun16  
  

### Настройка времени:  
ln -sf /usr/share/zoneinfo/YOUR/TIME/ZONE /etc/localtime  
hwclock --systohc --utc  
pacman -S ntp  
sudo systemctl start ntpd --now  
sudo systemctl enable ntpd --now  
sudo systemctl start systemd-timesyncd  
sudo systemctl enable systemd-timesyncd  

### Настройка имени хост машины:  
echo ROMPC > /etc/hostname  

### Настройка пароля root'a:  
passwd  
  
mkinitcpio -p linux  

### Настройка загрузчика grub:  
pacman -S grub  
grub-install /dev/sda  
grub-mkconfig -o /boot/grub/grub.cfg  

### Настройка networkmanager:  
pacman -S networkmanager  
systemctl start NetworkManager.service  
systemctl enable NetworkManager.service  
pacman -S network-manager-applet  

### Reboot:  

### Настройка пользователя:  
useradd -m -g users -G wheel username_1  
passwd username_1  
  
*Разрешаем пользователям состоящим в группе wheel использовать sudo (расскоментировав следующие строки):*  
>%wheel ALL=(ALL) ALL):  
  
EDITOR=vim visudo  
  
*Разрешаем pacman скачивать 32 битные библиотеки, редактируем файл /etc/pacman.conf (расскоментировав следующие строки):*  
>[multilib]  
Include = /etc/pacman.d/mirrorlist  
  

### Установка и настройка основных пакетов:  
pacman -S sudo  
pacman -S fakeroot  
pacman -S debugedit  
pacman -S make  
pacman -S go  
  
pacman -S openssh  
pacman -S sshfs  
pacman -S sshpass  
pacman -S fail2ban  
systemctl start fail2ban.service  
systemctl enable fail2ban.service  
systemctl start sshd.service  
systemctl enable sshd.service  
ssh-keygen  
  
pacman -S curl  
pacman -S wget  
pacman -S git  
pacman -S vim  
pacman -S zsh  
*Сменить bash на zsh в /etc/passwd*  
pacman -S tmux  
pacman -S xclip  
pacman -S htop  
  
pacman -S ufw  
sudo ufw enable  
*Настроить ufw*  
pacman -S net-tools  
pacman -S wireless_tools  
pacman -S inetutils  
pacman -S whois  
pacman -S resolvconf  
pacman -S nmap  
pacman -S tcpdump  
pacman -S tcpreplay  
pacman -S iperf  
pacman -S socat  
pacman -S openbsd-netcat  
pacman -S net-snmp  
sudo systemctl start snmpd.service  
sudo systemctl start snmptrapd.service  
sudo systemctl enable snmpd.service  
sudo systemctl enable snmptrapd.service  
pacman -S wireguard-tools  
*Настройка wg*  
pacman -S openvpn  
pacman -S openconnect  
pacman -S aur/hiddify  

### Настройка хранилища:  
mkdir -p /local/store/  
chmod -R 777 /local/store/  
chown -R username_1:username_1 /local/store/  
cd /local/store/  
mkdir git  

### Настройка YAY:  
cd /local/store/git  
git clone https://aur.archlinux.org/yay.git  
cd ./yay/  
makepkg -si  

### Настройка OH-MY-ZSH:  
cd  
curl -L http://install.ohmyz.sh | sh  
cd /usr/share/  
sudo mkdir oh-my-zsh  
cd  
cd .oh-my-zsh  
sudo cp -r ./ /usr/share/oh-my-zsh/  
*Темы и плагины есть в install_my_settings.sh*  

### Настройка github:  
mkdir -p /local/store/git/  
cd /local/store/git/  
git clone https://github.com/romdegtyarev/Settings.git  
cd ./Settings/  
./install_my_settings.sh  

### Настройка SAMBA:  

### Настройка GUI:  
pacman -S i3-gaps  
pacman -S i3blocks  
pacman -S i3status  
pacman -S aur/i3lock-color  
*Папка с настройками xorg /etc/X11/xorg.conf.d/ есть в install_my_settings.sh*  
pacman -S lxappearance  
*Установка темы vimix-icon-theme vimix-gtk-themes есть в install_my_settings.sh*  
pacman -S aur/gradience
pacman -S aur/gtk-theme-config  
pacman -S materia-gtk-theme  
  
pacman -S dunst  
  
pacman -S rofi  
pacman -S dmenu  
pacman -S j4-dmenu-desktop  
pacman -S picom  
pacman -S feh  
  
pacman -S alsa-utils  
pacman -S alsa-plugins  
pacman -S pavucontrol  
pacman -S pamixer  
pacman -S pulseaudio  
pacman -S pulseaudio-alsa  
pacman -S pipewire  
pacman -S pipewire-audio  
  
pacman -S xorg-xinit  
pacman -S xorg-server  
pacman -S xorg-xset  
pacman -S xorg-xrandr  
  
pacman -S otf-font-awesome  
pacman -S woff2-font-awesome  
pacman -S awesome-terminal-fonts  
pacman -S powerline-fonts  
pacman -S aur/noto-color-emoji-fontconfig  
  
pacman -S aur/neofetch  
pacman -S sl  
pacman -S scrot  
pacman -S xxkb  
pacman -S aur/xkblayout  
pacman -S aur/xkblayout-state-git  
pacman -S aur/xautolock  
pacman -S xdotool  
  
pacman -S gnome-system-monitor  
pacman -S gnome-logs  
pacman -S pcmanfm  
pacman -S xarchiver  
pacman -S aur/roxterm  
pacman -S firefox  
pacman -S chromium  
pacman -S keepassxc  

### Настройка soft'a:  
pacman -S unrar  
pacman -S unzip  
pacman -S zip  
pacman -S extra/libzip  
pacman -S docker  
pacman -S docker-compose  
usermod -aG docker username_1  
systemctl start docker.service  
systemctl enable docker.service  
  
pacman -S ntfs-3g  
pacman -S gvfs-mtp  
pacman -S mtpfs  
pacman -S libmtp *Монтирование устройств*  
pacman -S gvfs-google  
pacman -S gvfs-nfs  
pacman -S gvfs-smb  
  
pacman -S rsync  
pacman -S acpi *Температура, Батарея*  
pacman -S lshw  
pacman -S usbutils  
pacman -S nut  
pacman -S upower  
  
pacman -S blueman  
pacman -S bluez  
pacman -S bluez-utils  
pacman -S pulseaudio-bluetooth  
  
pacman -S cups  
pacman -S system-config-printer  
pacman -S aur/xerox-phaser-3020  
  
pacman -S vlc  
pacman -S spotify-launcher  
pacman -S playerctl  
  
pacman -S pinta  
pacman -S gimp  
pacman -S aur/simplescreenrecorder  
  
pacman -S qrencode  
pacman -S jq  
pacman -S gnome-calculator  
pacman -S korganaizer  
pacman -S evince *PDF*  
pacman -S nsxiv  
pacman -S gedit  
pacman -S gedit-plugins  
pacman -S libreoffice-fresh  
  
pacman -S telegram-desktop  
pacman -S discord  
pacman -S thunderbird  
  
*Eclipse Установщик или AUR*  
pacman -S meld  
pacman -S wireshark-qt  
sudo chmod 755 /usr/bin/dumpcap  
  
pacman -S gdb  
pacman -S aur/clang-format-all-git  
pacman -S python-flake8  
pacman -S doxygen  
pacman -S python  
pacman -S aur/rpmlint  
pacman -S man-db  
pacman -S man-pages  

### Настройка пакетов для работы:  
pacman -S aur/memstat  
pacman -S sysstat  
pacman -S tftp-hpa  
pacman -S nfs-utils  
  
docker pull postgres  
docker pull freeradius/freeradius-server  
docker pull lfkeitel/tacacs_plus  
docker pull python  
pacman -S scapy  
pacman -S python-scapy  
  
pacman -S minicom  
pacman -S mattermost-desktop  
pacman -S virt-viewer  
  
*Установка необходимых сертификатов*  

