
# Домашнее задание к занятию 2. «Применение принципов IaaC в работе с виртуальными машинами»


## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.
- Какой из принципов IaaC является основополагающим?

### Ответ:

---
1. Опишите основные преимущества применения на практике IaaC-паттернов.
   * Ускоряет процесс разворачивания необходимой инфраструктуры
   * Позволяет избежать ситуаций недокументированных изменений, быстрый откат изменений и деплой новых
   * Дает возможность быстро производить доставку кода для непрерывной его интеграции в продукте, а так же провести тестирование
2. Какой из принципов IaaC является основополагающим?
   * Идемпотентность

---

## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

### Ответ:

---
* Чем Ansible выгодно отличается от других систем управление конфигурациями?
разработкой занимается крупная компания - RedHat
не требует агентов на управляемых хостах - доступ по ssh
* Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?
Pull, т.к. отсутствует единая точка отказа и хранения данных для доступа.

---

## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials),
- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),
- Ansible.

*Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.*

### Ответ:
* VirtualBox
```bash
$ VBoxManage --version
7.0.6r155176
```
* Vagrant
```bash
$ vagrant -v
Vagrant 2.3.4
```
* Terraform
```bash
$ terraform -v
Terraform v1.4.6
on darwin_amd64
```
* Ansible
```bash
$ ansible --version
ansible [core 2.14.5]
  config file = None
  configured module search path = ['/Users/dshulc/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/Cellar/ansible/7.5.0/libexec/lib/python3.11/site-packages/ansible
  ansible collection location = /Users/dshulc/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.11.3 (main, Apr  7 2023, 19:25:52) [Clang 14.0.0 (clang-1400.0.29.202)] (/usr/local/Cellar/ansible/7.5.0/libexec/bin/python3.11)
  jinja version = 3.1.2
  libyaml = True
```

## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.
- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды
```
docker ps,
```

### Ответ:

---
```bash
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

---
