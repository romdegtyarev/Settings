#!/bin/bash


LINUXUSER=""
LINUXUPLINK=""
BROWSER=""
# VPN
SERVER=""
USERNAME=""
PASSWORD=""
VPN=""


# Проверка наличия необходимых пакетов
for cmd in ip iptables openconnect; do
    if ! command -v $cmd &> /dev/null; then
        echo "Ошибка: $cmd не установлен. Установите его и повторите попытку."
        exit 1
    fi
done


# Проверка параметров
if [ "$1" == "down" ]; then
    echo "Отключение VPN и очистка ресурсов..."

    # Завершение процессов в пространстве имен
    sudo ip netns pids vpnspace | xargs -rd'\n' sudo kill
    sudo rm -rf /etc/netns/vpnspace

    # Удаление правил iptables
    sudo iptables -t nat -D POSTROUTING -o $LINUXUPLINK -j MASQUERADE
    sudo iptables -D FORWARD -i $LINUXUPLINK -o veth0 -j ACCEPT
    sudo iptables -D FORWARD -i veth0 -o $LINUXUPLINK -j ACCEPT

    # Удаление виртуального интерфейса и пространства имен
    sudo ip link del veth0
    sudo ip netns delete vpnspace

    echo "Скрипт завершен."
    exit 0
fi


echo "Проверка существования пространства имен."
# Проверка существования пространства имен
if sudo ip netns list | grep "vpnspace"; then
    echo "Пространство имен 'vpnspace' уже существует."
else
    # Создание пространства имен
    if ! sudo ip netns add vpnspace; then
        echo "Ошибка: не удалось создать пространство имен."
        exit 1
    fi

    # Создание виртуальной пары интерфейсов
    sudo ip link add veth0 type veth peer name veth1

    # Перемещение одного интерфейса в пространство имен
    sudo ip link set veth1 netns vpnspace

    # Настройка интерфейсов
    sudo ip addr add 192.168.10.1/24 dev veth0
    sudo ip link set veth0 up

    sudo ip netns exec vpnspace ip addr add 192.168.10.2/24 dev veth1
    sudo ip netns exec vpnspace ip link set veth1 up

    # Добавление маршрута по умолчанию
    sudo ip netns exec vpnspace ip route add default via 192.168.10.1

    # Настройка NAT
    sudo iptables -t nat -A POSTROUTING -o $LINUXUPLINK -j MASQUERADE
    sudo iptables -A FORWARD -i $LINUXUPLINK -o veth0 -j ACCEPT
    sudo iptables -A FORWARD -i veth0 -o $LINUXUPLINK -j ACCEPT
    sudo mkdir -p /etc/netns/vpnspace
    echo "nameserver 8.8.8.8" |sudo tee /etc/netns/vpnspace/resolv.conf
fi

# Проверка наличия интерфейса VPN
if ! sudo ip netns exec vpnspace ip a | grep -q "tun"; then
    # Запуск VPN
    echo "Подключение к VPN..."
    echo "$PASSWORD" | sudo ip netns exec vpnspace $VPN &
    sleep 10

    # Проверка наличия интерфейса VPN после подключения
    if sudo ip netns exec vpnspace ip a | grep -q "tun"; then
        echo "VPN подключен."
    else
        echo "Ошибка: VPN не подключен."
        exit 1
    fi
else
    echo "VPN уже подключен."
fi

# Проверка соединения
echo "Проверка соединения..."
sudo ip netns exec vpnspace ping -c 4 8.8.8.8

# Вывод информации о сетевых интерфейсах в пространстве имен
echo "Информация о сетевых интерфейсах в пространстве имен:"
sudo ip netns exec vpnspace ip addr

# Запуск браузера
sudo ip netns exec vpnspace su $LINUXUSER -c $BROWSER > /dev/null 2>&1 &

# Завершение скрипта
echo "Скрипт завершен."

