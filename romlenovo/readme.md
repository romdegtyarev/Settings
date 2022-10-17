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
*Разделы: /boot, swap, /, /local/store:*  
mkpart primary ext4 1MiB 100MiB  
set 1 boot on  
mkpart primary linux-swap 100MiB 16GiB  
mkpart primary ext4 16GiB 300GiB  
mkpart primary ext4 300GiB 100%  
quit  

4. Форматируем разделы:  
mkfs.ext4 /dev/sda1  
mkswap /dev/sda2  
mkfs.ext4 /dev/sda3  
mkfs.ext4 /dev/sda4  

5. Монтируем разделы:  
mount /dev/sda3 /mnt  
mkdir -p /mnt/boot  
mkdir -p /mnt/local/store  
mount /dev/sda1 /mnt/boot/  
mount /dev/sda4 /mnt/local/store  
swapon /dev/sda2  

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
timedatectl set-timezone YOUR/TIME/ZONE  
pacman -S ntpdate  
ntpdate time.google.com  

### Настройка имени хост машины:  
echo ROMLENOVO > /etc/hostname  

### Настройка пароля root'a:  
passwd  

*В файл /etc/mkinitcpio.conf в поле HOOKS добавляем keymap:*  
>HOOKS="base udev … keymap"  
  
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
systemctl start sshd.service  
systemctl enable sshd.service  
ssh-keygen  
  
pacman -S git  
pacman -S vim  
pacman -S zsh  
*Сменить bash на zsh в /etc/passwd*  
pacman -S tmux  
pacman -S xclip  
pacman -S htop  
  
pacman -S go  
  
pacman -S net-tools  
pacman -S wireless_tools  
pacman -S extra/wireguard-tools  
*Настройка wg*  
pacman -S openvpn  

### Настройка хранилища:  
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
pacman -S i3-gaps  
pacman -S i3blocks  
pacman -S i3status  
pacman -S i3lock-fancy-rapid-git  
*Папка с настройками xorg /etc/X11/xorg.conf.d/*  
pacman -S aur/vimix-icon-theme  
pacman -S aur/vimix-gtk-themes  
pacman -S lxappearance  
  
pacman -S rofi  
pacman -S dmenu  
pacman -S j4-dmenu-desktop  
pacman -S compton  
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
pacman -S xf86-video-nouveau  
pacman -S xorg-xset  
  
pacman -S xorg-xbacklight  
pacman -S xf86-input-elographics  
pacman -S xf86-input-evdev  
pacman -S xf86-input-synaptics  
pacman -S xf86-input-void  
pacman -S aur/touchpad-toggle  
  
pacman -S oft-font-awesome  
pacman -S ttf-font-awesome  
pacman -S awesome-terminal-fonts  
  
pacman -S neofetch  
pacman -S sl  
pacman -S scrot  
pacman -S community/xxkb  
pacman -S i3-xkb-switcher  
pacman -S pcmanfm  
pacman -S roxterm  
pacman -S firefox  
pacman -S keepassxc  

### Настройка soft'a:  
pacman -S extra/unrar  
pacman -S unzip  
pacman -S docker  
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
  
pacman -S core/openresolv  
pacman -S blueman  
pacman -S extra/bluez  
pacman -S pulseaudio-modules-bt  
  
pacman -S wpa_supplicant_gui  
pacman -S network-manager-applet  
  
pacman -S cups  
pacman -S system-config-printer  
  
pacman -S vlc  
pacman -S mpc  
pacman -S mpd  
pacman -S ncmpc  
pacman -S aur/cider  
  
pacman -S pinta  
pacman -S gimp  
pacman -S simplescreenrecorder  
  
pacman -S extra/qrencode  
pacman -S community/galculator  
pacman -S evince *PDF*  
pacman -S gedit  
pacman -S gedit-plugins  
pacman -S libreoffice-fresh  
  
pacman -S telegram-desktop  
pacman -S discord  
pacman -S thunderbird  
  
pacman -S wireshark-qt  
sudo chmod 755 /usr/bin/dumpcap  

### Настройка пакетов для работы:  
pacman -S community/virtualbox  
pacman -S linux-headers  
pacman -S virtualbox-host-dkms  
pacman -S virtualbox-guest-iso  
modprobe vboxdrv  
  
pacman -S freeradius  
pacman -S aur/tacacs-plus  
pacman -S community/scapy  
pacman -S community/python-scapy  
  
pacman -S freerdp  
pacman -S xrdp  
  
pacman -S extra/pidgin  
pacman -S mattermost-desktop  
  
pacman -S aur/gns3-server  
pacman -S aur/gns3-gui  
pacman -S aur/ubridge  
pacman -S extra/qemu  
pacman -S aur/dynamips  


