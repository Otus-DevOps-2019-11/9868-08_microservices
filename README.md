## 9868-08 microservices repository
=======

## Homework-20 (monitoring-1)

- Prometheus: запущен, сконфигурован
• Изучен мониторинг состояния микросервисов
• Собраны метрики хоста с использованием экспортера


## Homework-19 (gitlab-ci-1)

- Поднял новый инстанс с помощью docker-machine
- Описал для приложения этапы пайплайна
- Запустил провижин omnibus инсталляции gitlab с помощью docker-compose.
- Настроил CI/CD Pipeline для проекта reddit
- Добавли Dev-окружение
- разделил работу конвеьера на 2 этапа: stage и production
- Добавил условия и ограничения
- Добавил динамические окружения (Теперь, на каждую ветку в git отличную от master Gitlab CI будет определять новое окружение).

Homework-17 (docker-4)
В процессе сделано:
docker-compose изменен под кейс с множеством сетей, сетевых алиасов (стр 18).
параметризован с помощью переменных окружений: • порт публикации сервиса ui • версии сервисов
Параметризованы параметры записаны в отдельный файл .env
порт публикации сервиса ui изменен на 80
Изменен docker-compose под кейс с множеством сетей, сетевых алиасов
RE: При запуске проекта вы увидите, что все создаваемые docker-compose сущности имеют одинаковый префикс, к примеру dockermicroservices_ui_1 таких сущьностей не наблюдаю: docker-user@docker-host:~$ sudo docker ps -a CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES 167a820db419 111/comment:1.0 "puma" 5 minutes ago Up 5 minutes src_comment_1 5661e76d8091 mongo:3.2 "docker-entrypoint.s…" 5 minutes ago Up 5 minutes 27017/tcp src_post_db_1 0cf479a9f7da 111/post:1.0 "python3 post_app.py" 5 minutes ago Up 5 minutes src_post_1 30f6b7fbcefe 111/ui:1.0 "puma" 5 minutes ago Up 5 minutes 0.0.0.0:80->9292/tcp src_ui_1
Homework-16 (docker-3)
В процессе сделано:
Контейнеры docker (mongo:latest, post:1.0, comment:1.0, ui:1.0) запущены в разных сетях. Рассмотрены правила iptables которые добавляет docker Установлен docker-compose на локальную машину Собраны образы приложения reddit с помощью docker-compose Запущено приложение reddit с помощью docker-compose

Homework-16 (docker-3)
В процессе сделано:
Описыван и собиран Docker образ для сервисного приложения. Приложение работает по ссылке http://35.195.79.55:9292/ Запущены контейнеры с другими сетевыми алиасами Оптимизирован размер образа докер (взят пустой ubuntu и на нём развернут ruby) Проведена работа с docker volume. Данные сохряняются при перезапуске контейнера.

Homework-15 (docker-2)
В процессе сделано:
Описыван и собиран Docker-образ для сервисного приложения Образ оптимизировать с помощью linter. Добавлено обновление pip Запущено приложение на основе Docker-образа Размер образа умешьшился ~20МБ благодаря единомой команде сбора
