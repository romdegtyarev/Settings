# Система:  
Ubuntu 22.04.1 LTS x86_64  

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
sudo apt-get install openssh  
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
  
sudo apt-get install wireguard  
*Настройка wg*  

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
sudo apt-get install fonts-font-awesome  
sudo apt-get install fonts-powerline  
sudo apt-get install powerline  

sudo apt-get install neofetch  

### Настройка soft'a:  
sudo apt-get install unrar  
sudo apt-get install docker  
usermod -aG docker username_1  
systemctl start docker.service  
systemctl enable docker.service  
sudo apt-get install docker.io  
sudo apt-get install docker-compose  
  
sudo apt-get install rsync  
sudo apt-get install apache2-utils  

### Настройка пакетов для работы:  
sudo apt-get install freeradius  


