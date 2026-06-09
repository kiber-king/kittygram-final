# Kittygram

Приложение для публикации фотографий котиков. Пользователи могут регистрироваться, загружать фото своих котов с именем и годом рождения, а также просматривать котиков других пользователей.

## Технологии

- Django REST Framework
- React
- PostgreSQL
- Docker / Docker Compose
- Nginx
- Terraform
- GitHub Actions

## Инфраструктура

Инфраструктура разворачивается в Yandex Cloud с помощью Terraform:

- VPC с подсетями в трёх зонах доступности
- Security Group (входящий трафик только на порты 22 и 80)
- Compute Cloud (Ubuntu 20.04, 2 CPU, 4 GB RAM)
- Object Storage для хранения Terraform state

Для создания инфраструктуры используется GitHub Actions workflow (`terraform.yml`) с тремя операциями: `plan`, `apply`, `destroy`.

## CI/CD

При пуше в ветку `main` автоматически запускается pipeline:

1. Проверка кода бэкенда (flake8)
2. Сборка Docker-образов бэкенда, фронтенда и gateway
3. Пуш образов на Docker Hub
4. Деплой на сервер через SSH
5. Уведомление в Telegram

## Локальный запуск

```bash
cp .env.example .env
docker compose up -d
```

## Переменные окружения

Пример заполнения в `.env.example`.
