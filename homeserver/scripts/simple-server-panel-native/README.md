# Simple Server Panel Native

Очень простой web-интерфейс для сервера без Docker.

## Что умеет

- показывает текущее время;
- показывает hostname;
- показывает uptime;
- показывает CPU, load average, RAM;
- показывает состояние дисков;
- показывает статус `minidlna.service`;
- запускает скрипт с параметром `Start` или `Stop`.

## Установка

```bash
sudo apt update
sudo apt install -y python3 python3-venv sudo
```

Скопировать проект на сервер и запустить:

```bash
chmod +x install.sh
./install.sh
```

## Настройка sudo без пароля

Открыть:

```bash
sudo visudo -f /etc/sudoers.d/simple-server-panel
```

Вставить содержимое файла:

```text
sudoers.d/simple-server-panel
```

Если сервис запускается не от пользователя `rom`, замени `rom` на нужного пользователя.

Проверить пользователя можно так:

```bash
whoami
```

## Запуск сервиса

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now simple-server-panel
```

Открыть:

```text
http://localhost:8080
```

## Логи

```bash
sudo journalctl -u simple-server-panel -f
```

## Перезапуск

```bash
sudo systemctl restart simple-server-panel
```

## Ручной запуск для проверки

```bash
cd /opt/simple-server-panel
source .venv/bin/activate
uvicorn app.main:app --host 0.0.0.0 --port 8080
```

## Важно

Не выставляй этот интерфейс напрямую в интернет.

