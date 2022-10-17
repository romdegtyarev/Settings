# Система:  
Raspberry Pi OS Lite  

# Before start:  

# Start:  
sudo apt-get update  
sudo apt-get upgrade  

### Настройка языка:  

### Настройка локали:  

### Настройка времени:  

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
  
sudo apt-get install git  
sudo apt-get install vim  
sudo apt-get install zsh  
*Сменить bash на zsh в /etc/passwd*  
sudo apt-get install tmux  
sudo apt-get install xclip  
sudo apt-get install htop  
  
sudo apt-get install net-tools  

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
  
sudo apt-get install pavucontrol  
*Скрипт установки или*  
*sudo apt-get install pamixer*  
  
sudo apt-get install xinit  
sudo apt-get install xorg  
  
sudo apt-get install fonts-font-awesome  
sudo apt-get install fonts-powerline  
sudo apt-get install fonts-hack-otf  
sudo apt-get install fonts-hack-ttf  
sudo apt-get install fonts-hack-web  
sudo apt-get install powerline  

sudo apt-get install neofetch  
  
sudo apt-get install pcmanfm  
sudo apt-get install roxterm  

### Настройка soft'a:  

### Настройка пакетов для работы:  


