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
*Разделы: /, swap:*  
mkpart primary linux-swap 100MiB 9GiB  
mkpart primary ext4 9GiB 100%  
quit  

4. Форматируем разделы:  
mkswap /dev/sda1  
mkfs.ext4 /dev/sda2  

5. Монтируем разделы:  
mount /dev/sda1 /mnt  
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
ln -sf /usr/share/zoneinfo/YOUR/TIME/ZONE /etc/localtime  
hwclock --systohc --utc  
pacman -S ntp  
sudo systemctl start ntpd --now  
sudo systemctl enable ntpd --now  
sudo systemctl start systemd-timesyncd  
sudo systemctl enable systemd-timesyncd  

### Настройка имени хост машины:  
echo HOMESERVER > /etc/hostname  

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
sudo useradd -d /dev/null -s /usr/sbin/nologin -u UID -g GID -p UPASS UNAME  
  
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
pacman -S wireguard-tools  
*Настройка wg*  
pacman -S openvpn  
pacman -S openconnect  

### Настройка хранилища:  
mkdir -p /local/store/  
chmod -R 777 /local/store/  
chown -R username_1:username_1 /local/store/  

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
pacman -S otf-font-awesome  
pacman -S woff2-font-awesome  
pacman -S awesome-terminal-fonts  
pacman -S powerline-fonts  
pacman -S aur/noto-color-emoji-fontconfig  
  
pacman -S aur/neofetch  
pacman -S sl  

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
  
pacman -S aur/aria2c-daemon  
pacman -S rsync  
pacman -S acpi *Температура, Батарея*  
pacman -S lshw  
pacman -S usbutils  
pacman -S nut  
pacman -S upower  
pacman -S minidlna  
pacman -S aur/dump1090-git  

### Настройка пакетов для работы:  

