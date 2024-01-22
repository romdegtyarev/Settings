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
ln -sf /usr/share/zoneinfo/YOUR/TIME/ZONE /etc/localetime  
hwclock --systohc --utc  
pacman -S ntpdate  
sudo systemctl start ntpd.service
sudo systemctl enable ntpd.service

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

### Reboot:  

### Настройка пользователя:  
useradd -m -g users -G wheel username_1  
passwd username_1  
useradd -m -g users -G wheel username_2  
passwd username_2  
  
*Разрешаем пользователям состоящим в группе wheel использовать sudo (расскоментировав следующие строки):*  
>%wheel ALL=(ALL) ALL):  
  
EDITOR=vim visudo  
  
*Разрешаем pacman скачивать 32 битные библиотеки, редактируем файл /etc/pacman.conf (расскоментировав следующие строки):*  
>[multilib]  
Include = /etc/pacman.d/mirrorlist  
  

### Установка и настройка основных пакетов:  
pacman -S openssh  
pacman -S sshfs  
pacman -S sshpass  
pacman -S fail2ban  
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
  
pacman -S go  
  
pacman -S net-tools  
pacman -S whois  
pacman -S nmap  
pacman -S ufw  
pacman -S tcpdump  
pacman -S iperf  
pacman -S wireless_tools  
pacman -S wireguard-tools  
*Настройка wg*  
pacman -S openvpn  
pacman -S resolvconf  

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
*Темы и плагины*  

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
*Папка с настройками xorg /etc/X11/xorg.conf.d/*  
pacman -S lxappearance  
*Установка темы vimix-icon-theme vimix-gtk-themes*  
pacman -S gtk2  
pacman -S gtk3  
pacman -S gtk4  
pacman -S aur/gtk-theme-config  
pacman -S webkit2gtk  
pacman -S webkitgtk-6.0  
pacman -S lx-qt-themes
pacman -S qt5-styleplugins  
pacman -S qt6gtk2  
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
  
pacman -S xorg-xinit  
pacman -S xorg-server  
pacman -S xorg-xset  
  
pacman -S oft-font-awesome  
pacman -S ttf-font-awesome  
pacman -S awesome-terminal-fonts  
pacman -S powerline-fonts  
  
pacman -S neofetch  
pacman -S sl  
pacman -S scrot  
pacman -S xxkb  
pacman -S aur/xkb-switch-i3  
pacman -S pcmanfm  
pacman -S aur/roxterm  
pacman -S firefox  
pacman -S keepassxc  

### Настройка soft'a:  
pacman -S unrar  
pacman -S unzip  
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
  
pacman -S aur/aria2c-daemon  
pacman -S rsync  
pacman -S acpi *Температура, Батарея*  
pacman -S lshw  
pacman -S usbutils  
pacman -S nut  
pacman -S upower  
  
pacman -S blueman  
pacman -S bluez  
pacman -S pulseaudio-bluetooth  
  
pacman -S aur/wpa_supplicant_gui  
pacman -S network-manager-applet  
pacman -S inetutils  
  
pacman -S cups  
pacman -S system-config-printer  
  
pacman -S vlc  
pacman -S mpc  
pacman -S mpd  
pacman -S ncmpc  
pacman -S aur/cider  
  
pacman -S pinta  
pacman -S gimp  
pacman -S aur/simplescreenrecorder  
  
pacman -S qrencode  
pacman -S galculator  
pacman -S evince *PDF*  
pacman -S gedit  
pacman -S gedit-plugins  
pacman -S libreoffice-fresh  
pacman -S jq  
pacman -S gnome-calculator  
pacman -S gitlab-runner  
  
pacman -S telegram-desktop  
pacman -S discord  
pacman -S thunderbird  
  
*Eclipse Установщик*  
pacman -S meld  
pacman -S wireshark-qt  
sudo chmod 755 /usr/bin/dumpcap  
  
pacman -S aur/chirp-next  
  
pacman -S gdb  
pacman -S clang-format-all-git  
pacman -S doxygen  
pacman -S python  
pacman -S python-pip  
pacman -S aur/rpmlint  
pacman -S man-db  
pacman -S man-pages  
pacman -S korganaizer  

### Настройка пакетов для работы:  
pacman -S virtualbox  
pacman -S virtualbox-host-dkms  
pacman -S virtualbox-guest-iso  
pacman -S minicom  
pacman -S net-snmp  
pacman -S tcpreplay  
pacman -S socat  
pacman -S aur/memstat  
  
pacman -S freeradius  
docker pull lfkeitel/tacacs_plus  
pacman -S scapy  
pacman -S python-scapy  
  
pacman -S tftp-hpa  
pacman -S nfs-utils  
pacman -S nginx  
pacman -S haproxy  
  
pacman -S mattermost-desktop  
  
pacman -S aur/gns3-server  
pacman -S aur/gns3-gui  
pacman -S aur/ubridge  
pacman -S qemu  
pacman -S aur/dynamips  

#### RDP  
pacman -S freerdp  
pacman -S xrdp  

