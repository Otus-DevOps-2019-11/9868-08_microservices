# 9868-08_infra
9868-08 microservices repository

## Homework-16 (docker-3)
- Наше приложение разбито на несколько компонентов
- описаны и собираны с учетом рекомендациq линтера hadolint Docker-образы для сервисного приложения


## Homework-15 (docker-2)
- Создан docker host
- Создан свой образ
- Свой образ залит на Docker Hub
- Создана машина в GCP. На этой машине развернут свой образ из Docker Hub 
- Настроено поднятие инстанса с докером с помощью Terraform, их количество НЕ задается переменной.   count > 1 вызывает ошибку 
Error: Cycle: google_compute_instance.app[2], google_compute_instance.app[1], google_compute_instance.app[0]

