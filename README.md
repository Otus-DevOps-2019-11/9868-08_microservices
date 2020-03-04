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



## Homework-16 (docker-3)

#### В процессе сделано:

Описыван и собиран Docker образ для сервисного приложения.
Приложение работает по ссылке http://35.195.79.55:9292/
Запущены контейнеры с другими сетевыми алиасами
Оптимизирован размер образа докер (взят пустой ubuntu и на нём развернут ruby)
Проведена работа с docker volume. Данные сохряняются при перезапуске контейнера.


## Homework-15 (docker-2)

#### В процессе сделано:

Описыван и собиран Docker-образ для сервисного приложения
Образ оптимизировать с помощью linter. Добавлено обновление pip
Запущено приложение на основе Docker-образа
Размер образа умешьшился ~20МБ благодаря единомой команде сбора
<<<<<<< HEAD
>>>>>>> 1
=======
>>>>>>> 5c90353cf541025b9d18a28dc54a74272b297c5a
