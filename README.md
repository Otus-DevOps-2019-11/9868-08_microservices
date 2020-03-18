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


Homework-13 Ansible-4
=======

Homework-11 Ansible-4
В процессе сделано:
разработка при помощи Vagrant:
установлен Vagrant;
описана локальная инфраструктура в Vagrantfile и созданы описанные виртуальные машины;
доработаны роли app и db с помощью провижинера Ansible в Vagrant;
(Задание со *, слайд 49) дополнена конфигурация Vagrant для корректной работы проксирования приложения с помощью nginx;
тестирование ролей при помощи Molecule и Testinfra:
установлены необходимые компоненты для тестирование в virtualenv: ansible, molecule, testinfra, python-vagrant;

создана заготовка для тестов роли db в Vagrant;

добавлены тесты (использованы модули Testinfra) в файл db/molecule/default/tests/test_default.py;

описана (db/molecule/default/molecule.yml) и создана виртуальная машина для тестирование; =======

описана (db/molecule/default/molecule.yml) и создана виртуальная машина для тестирование; !!! Дла работы с molecula на рабочей машине потребовались права root!

выполены тесты с помощью Molecule:

molecule converge;
molecule verify;
образы Packer (reddit-app-base-, reddit-db-base-) пересобраны c использованием ролей app и db соответственно;
Homework-12 Ansible-3
=======

Homework-10 Ansible-3
В процессе сделано:
созданы роли app и db: плейбуки перенесены в соответствующие роли;
созданы окружения stage и prod, определены их настройки;
произведен рефакторинг инфраструктурного репозитория в директории ansible;
настроено исрользование community роли jdauphant.nginx в stage и prod окружениях, открыт tcp порт 80 в конфигурации terraform;
в конфигурацию Terraform открыт 80 порт
работа с Ansible Vault:
добален плейбук для создания пользователей ОС;
созданы и зашифрованы файлы с данными пользователями для окружений stage и prod;
Homework-11 Ansible-2
В процессе сделано:
Использованы плейбуки, шаблоны и хендлеры для конфигурации окружения и деплоя тестового приложения со следующими подходами:
один плейбук (playbook) - один сценарий (play);
один плейбук - много сценариев;
много плейбуков;
изменены провиженеры образов Packer: bash-скрипты заменены на плейбуки Ansible;
(Задание со *) настроен dynamic inventory для GCP (dynamic_inventory.sh).
Задание со * (слайд 66)
Dynamic inventory (dynamic_inventory.sh) используется по-умолчанию (настроено в ansible.cfg). Для запуска плейбуков со статическими inventory необходимо ввести команду вида:

ansible-playbook -i inventory site.yml
Homework-10 Ansible-1
В процессе сделано:
выполнена установка Ansible;
познакомился с базовыми функциями и инвентори в Ansible;
выполнены различные модули (command, shell, systemd, git) на базе инфраструктуры, подготовленной на прошлых ДЗ;
написан простой playbook (с использованием модуля git) для скачивания исходных кодов reddit app из репозирования.
Ответ на вопрос со слайда 29
После выполнения команды ansible app -m command -a 'rm -rf ~/reddit' повторное выполнение playbook clone.yml дает следующий результат:

PLAY RECAP *************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0
Переменная changed стала равна 1, т.е. наш плейбук сделал изменение на хосте app - склонировал репозиторий, потому что предыдущей командой мы удалили директорию reddit.

Homework-9 Terraform-2
В процессе сделано:
настройка и импорт ресурсов firewall с помощью Terraform;
настройка ресурса IP адреса;
структуризация ресурсов: созданы 2 виртуальные машины app (app.tf) и db (db.tf), правило firewall пересено в vpc.tf;
созданы и параметризованы модули для приложения (app), базы данных (db), firewall (vpc);
созданы окружения prod и stage, которые используют описанные выше модули;
работы с реестром модулей: использование модуля storage-bucket.
Задание со * (слайд 61)
Настроен удаленный бекенд Terraform на Google Cloud Storage.
Файлы terraform.tfstate теперь отсутствует в локальной директории.
При попытке повторного применения конфигурации получаем следующую ошибку:

terraform apply -auto-approve
Acquiring state lock. This may take a few moments...

Error: Error locking state: Error acquiring the state lock: writing "gs://bucket-name/terraform/state/default.tflock" failed: googleapi: Error 412: Precondition Failed, conditionNotMet
Lock Info:
  ID:        1530703300181511
  Path:      gs://bucket-name/terraform/state/default.tflock
  Operation: OperationTypeApply
  Who:       
  Version:   0.11.7
  Created:   2018-07-04 11:21:39.939498726 +0000 UTC
  Info:


Terraform acquires a state lock to protect the state from being written
by multiple users at the same time. Please resolve the issue above and try
again. For most commands, you can disable locking with the "-lock=false"
flag, but this is not recommended.
Задание со * (слайд 62)
Добавлены provisioner в модули app и db, для работы приложения
Реализовано отключение provisioner с использованием переменной и ресурса "null_resource".
Homework-8
В процессе сделано:
установлен и настроен Terraform, в том числе и провайдер GCP;
созданы следующие ресурсы Terraform:
инстанс (google_compute_instance) c ssh-ключем для пользователя appuser в метадданных данного инстанса, тегом "reddit-app" провижинерами, (provisioners) для развертывания приложения reddit app (при этом приложение запускается при старте инстанса (как systemd unit));
првило firewall (google_compute_firewall) для инстансов с тегом "reddit-app";
создан файл "outputs.tf" для выходных переменных (в нашем случае первоначально выводится присвоенный внешний IP-адрес инстанса);
создан файл "variables.tf" для параметризации конфигурационных файлов Terraform: параметризованы некоторые аттрибуты ресурсов в main.tf;
(Задание со *) добавлены ssh-ключи в метадданые проекта (в виде ресурса google_compute_project_metadata);
(Задание с **) создан HTTP-балансировщик для GCP (в файле "lb.tf"), направляющий траффик на указанный пул инстансов
(Задание с **) добавлен инстанс reddit-app2, сначала непосредственным копированием, потом с использованием параметра count (параметризованы адреса инстансов (URI, "${google_compute_instance.app.*.self_link}") в пуле балансировщика (файл "lb.tf")); в "outputs.tf" добавлены IP-адреса балансировщика и параметризован вывод IP-адресов всех инстансов.
Задание со * (ответ на вопрос со слайда 50)
Terraform, после выполнения команды terraform apply удаляет ssh-ключ пользователя appuser_web, который был добавлен из веб-интерфейса.

Задание с ** (ответ на вопрос со слайда 51)
При добавлении идентичных инстанстов код повторяется: теряется гибкость при модификации (создании, изменении, удалении) однотипных ресурсов, нарушается принцип DRY.

Homework-7
В процессе сделано:
создан и собран шаблон Packer (ubuntu16.json): Ubuntu 16.04 + Ruby + MongoDB
созданный шаблон (ubuntu16.json) параметризован, с использованием пользовательских переменных (в самом шаблоне и в файле variables);
на базе шаблона ubuntu16.json создан baked-шаблон (immutable.json): Ubuntu 16.04 + Ruby + MongoDB + Reddit App, при этом приложение запускается при старте инстанса (как systemd unit).
создан скрипт create-reddit-vm.sh для создания и запуска машины из подготовленного образа из семейства reddit-full.
Homework-6
Дополнительное задание (слайд 20)
Startup скрипт файл, передаваемый команде gcloud:

gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=scripts/startupscript.sh
где в опции startup-script=PATH/TO/FILE - относительный путь до файла скрипта.

Вариант со startup-script-url:

gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --scopes storage-ro \
  --metadata startup-script-url=gs://antonritter85-bucket/startupscripturl.sh
Дополнительное задание (слайд 21)
Правило firewall для работы приложения default-puma-server, созданное через команду gcloud:

gcloud compute firewall-rules create default-puma-server \
    --network default \
    --action allow \
    --direction ingress \
    --rules tcp:9292 \
    --source-ranges 0.0.0.0/0 \
    --target-tags puma-server
Информация для проверки
testapp_IP = 35.205.109.145 testapp_port = 9292

Homework-3
Задание со слайда 35:
ssh -o ProxyCommand='ssh -W %h:%p appuser@35.228.94.219' appuser@10.166.0.3
Доп. задание со слайда 35:
В файле ~/.ssh/config на локальной машине добавляем следующиие строки:

#Host someinternalhost
 HostName 10.166.0.3
 User appuser
 IdentityFile ~/.ssh/appuser
 ProxyCommand ssh -W %h:%p appuser@bastion

Host bastion
 HostName 35.228.94.219
 User appuser
 IdentityFile ~/.ssh/appuser
Это позволит подключиться к someinternalhost командой:

ssh someinternalhost
someinternalhost_IP = 10.166.0.3
9868-08_microservices
9868-08 microservices repository

=======

9868-08 microservices repository
=======

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
