# 9868-08_infra
9868-08 microservices repository

## Homework-26 (kubernetes-2)
• Развернуто локальное окружение для работы с Kubernetes (minicube в virtualbox)
• В minicube развернуты приложения ui,comment, post (самостоятельно)
• Для связи ui с post и comment созданы объекты Service для post, comment и mongodb
• Развернуто Kubernetes в GKE
• Развернуто Kubernetes в GKE 
  там создан namespace dev в котором запущен reddit
  http://35.225.3.217:31177/
• скриншот веб-интерфейса приложения приложен (kubernetes/Screenshot_reddit_in_GKE.png)

## Homework-25 (kubernetes-1)

Kubernetes развернут вручную используя The Hard Way;
kubectl apply -f <filename> проходит по созданным до этого deployment-ам (ui, post, mongo, comment) и поды запускаются
dinky$ kubectl get deployments
NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
comment-deployment   1/1     1            1           39m
mongo-deployment     1/1     1            1           40m
post-deployment      1/1     1            1           39m
ui-deployment        1/1     1            1           38m
[~@t440/09:48]
dinky$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
busybox                              1/1     Running   22         22h
comment-deployment-f887597c8-464k8   1/1     Running   0          39m
mongo-deployment-86d49445c4-wkp8v    1/1     Running   0          40m
post-deployment-84999d9569-cchph     1/1     Running   0          39m
ui-deployment-5554d5fdfc-2dgfp       1/1     Running   0          39m
[~@t440/09:48]
dinky$ kubectl get events
LAST SEEN   TYPE     REASON              OBJECT                                    MESSAGE
4m37s       Normal   Created             pod/busybox                               Created container busybox
4m37s       Normal   Started             pod/busybox                               Started container busybox
4m37s       Normal   Pulled              pod/busybox                               Container image "busybox:1.28" already present on machine
39m         Normal   Scheduled           pod/comment-deployment-f887597c8-464k8    Successfully assigned default/comment-deployment-f887597c8-464k8 to worker-0
39m         Normal   Pulling             pod/comment-deployment-f887597c8-464k8    Pulling image "123489/comment"
39m         Normal   Pulled              pod/comment-deployment-f887597c8-464k8    Successfully pulled image "123489/comment"
39m         Normal   Created             pod/comment-deployment-f887597c8-464k8    Created container post
39m         Normal   Started             pod/comment-deployment-f887597c8-464k8    Started container post
39m         Normal   SuccessfulCreate    replicaset/comment-deployment-f887597c8   Created pod: comment-deployment-f887597c8-464k8
39m         Normal   ScalingReplicaSet   deployment/comment-deployment             Scaled up replica set comment-deployment-f887597c8 to 1
40m         Normal   Scheduled           pod/mongo-deployment-86d49445c4-wkp8v     Successfully assigned default/mongo-deployment-86d49445c4-wkp8v to worker-1
40m         Normal   Pulling             pod/mongo-deployment-86d49445c4-wkp8v     Pulling image "mongo:3.2"
40m         Normal   Pulled              pod/mongo-deployment-86d49445c4-wkp8v     Successfully pulled image "mongo:3.2"
40m         Normal   Created             pod/mongo-deployment-86d49445c4-wkp8v     Created container mongo
40m         Normal   Started             pod/mongo-deployment-86d49445c4-wkp8v     Started container mongo
40m         Normal   SuccessfulCreate    replicaset/mongo-deployment-86d49445c4    Created pod: mongo-deployment-86d49445c4-wkp8v
40m         Normal   ScalingReplicaSet   deployment/mongo-deployment               Scaled up replica set mongo-deployment-86d49445c4 to 1
39m         Normal   Scheduled           pod/post-deployment-84999d9569-cchph      Successfully assigned default/post-deployment-84999d9569-cchph to worker-2
39m         Normal   Pulling             pod/post-deployment-84999d9569-cchph      Pulling image "123489/post"
39m         Normal   Pulled              pod/post-deployment-84999d9569-cchph      Successfully pulled image "123489/post"
39m         Normal   Created             pod/post-deployment-84999d9569-cchph      Created container post
39m         Normal   Started             pod/post-deployment-84999d9569-cchph      Started container post
39m         Normal   SuccessfulCreate    replicaset/post-deployment-84999d9569     Created pod: post-deployment-84999d9569-cchph
39m         Normal   ScalingReplicaSet   deployment/post-deployment                Scaled up replica set post-deployment-84999d9569 to 1
39m         Normal   Scheduled           pod/ui-deployment-5554d5fdfc-2dgfp        Successfully assigned default/ui-deployment-5554d5fdfc-2dgfp to worker-0
39m         Normal   Pulling             pod/ui-deployment-5554d5fdfc-2dgfp        Pulling image "123489/ui"
38m         Normal   Pulled              pod/ui-deployment-5554d5fdfc-2dgfp        Successfully pulled image "123489/ui"
38m         Normal   Created             pod/ui-deployment-5554d5fdfc-2dgfp        Created container ui
38m         Normal   Started             pod/ui-deployment-5554d5fdfc-2dgfp        Started container ui
39m         Normal   SuccessfulCreate    replicaset/ui-deployment-5554d5fdfc       Created pod: ui-deployment-5554d5fdfc-2dgfp
39m         Normal   ScalingReplicaSet   deployment/ui-deployment                  Scaled up replica set ui-deployment-5554d5fdfc to 1
[~@t440/09:49]
dinky$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://35.230.43.64:6443
  name: kubernetes-the-hard-way
contexts:
- context:
    cluster: kubernetes-the-hard-way
    user: admin
  name: kubernetes-the-hard-way
current-context: kubernetes-the-hard-way
kind: Config
preferences: {}
users:
- name: admin
  user:
    client-certificate: /home/dinky/Work/9868-08_kuber/kubernetes/admin.pem
    client-key: /home/dinky/Work/9868-08_kuber/kubernetes/admin-key.pem
[~@t440/09:49]
dinky$ kubectl get pod,svc -n kube-system
NAME                         READY   STATUS    RESTARTS   AGE
pod/coredns-5fb99965-txnrt   1/1     Running   0          22h
pod/coredns-5fb99965-vnrgb   1/1     Running   0          22h

NAME               TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
service/kube-dns   ClusterIP   10.32.0.10   <none>        53/UDP,53/TCP,9153/TCP   22h


## Homework-23 (logging-1)

• Сбор неструктурированных логов
• Визуализация логов
• Сбор структурированных логов
• Распределенная трасировка
• 



## Homework-21 (monitoring-2)

• Настроен мониторинг Docker контейнеров. К сожалению мне не удалось настроить отправку оповещение в слак
• Отработана визуализация метрик
• Собраны метрики работы приложения и бизнес метрики
• образы контейнеров загружены в докерхаб
https://hub.docker.com/repository/docker/dinky98/prometheus
https://hub.docker.com/repository/docker/dinky98/ui
https://hub.docker.com/repository/docker/dinky98/comment
https://hub.docker.com/repository/docker/dinky98/post
https://hub.docker.com/repository/docker/dinky98/prometheus
https://hub.docker.com/repository/docker/dinky98/alertmanager



## Homework-20 (monitoring-1)

•  Prometheus: запущен, сконфигурован
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
=======
## Homework-17 (docker-4)
#### В процессе сделано:
- docker-compose изменен под кейс с множеством сетей, сетевых алиасов (стр 18).
- параметризован с помощью переменных окружений:
• порт публикации сервиса ui
• версии сервисов
- Параметризованы параметры записаны в отдельный файл .env
- порт публикации сервиса ui изменен на 80
- Изменен docker-compose под кейс с множеством сетей, сетевых алиасов
- RE: При запуске проекта вы увидите, что все создаваемые docker-compose сущности имеют одинаковый префикс, к примеру dockermicroservices_ui_1
таких сущьностей не наблюдаю:
docker-user@docker-host:~$ sudo docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
167a820db419        111/comment:1.0     "puma"                   5 minutes ago       Up 5 minutes                               src_comment_1
5661e76d8091        mongo:3.2           "docker-entrypoint.s…"   5 minutes ago       Up 5 minutes        27017/tcp              src_post_db_1
0cf479a9f7da        111/post:1.0        "python3 post_app.py"    5 minutes ago       Up 5 minutes                               src_post_1
30f6b7fbcefe        111/ui:1.0          "puma"                   5 minutes ago       Up 5 minutes        0.0.0.0:80->9292/tcp   src_ui_1




## Homework-16 (docker-3)
#### В процессе сделано:
Контейнеры docker (mongo:latest, post:1.0, comment:1.0, ui:1.0) запущены в разных сетях.
Рассмотрены правила iptables которые добавляет docker
Установлен docker-compose на локальную машину
Собраны образы приложения reddit с помощью docker-compose
Запущено приложение reddit с помощью docker-compose



## Homework-16 (docker-2)
#### В процессе сделано:
Описыван и собиран Docker образ для сервисного приложения.
Приложение работает по ссылке http://35.195.79.55:9292/
Запущены контейнеры с другими сетевыми алиасами
Оптимизирован размер образа докер (взят пустой ubuntu и на нём развернут ruby)
Проведена работа с docker volume. Данные сохряняются при перезапуске контейнера.


## Homework-15 (docker-1)
#### В процессе сделано:
Описыван и собиран Docker-образ для сервисного приложения
Образ оптимизировать с помощью linter. Добавлено обновление pip
Запущено приложение на основе Docker-образа
Размер образа умешьшился ~20МБ благодаря единомой команде сбора

