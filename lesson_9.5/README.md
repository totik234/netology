# Домашнее задание к занятию 12 «GitLab»

## Основная часть

### DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

1. Образ собирается на основе [centos:7](https://hub.docker.com/_/centos?tab=tags&page=1&ordering=last_updated).
2. Python версии не ниже 3.7.
3. Установлены зависимости: `flask` `flask-jsonpify` `flask-restful`.
4. Создана директория `/python_api`.
5. Скрипт из репозитория размещён в /python_api.
6. Точка вызова: запуск скрипта.
7. При комите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.   


### Ответ: 
Подготовлен [Dockerfile](repository/Dockerfile) так же описан [pipeline](repository/.gitlab-ci.yml)



### Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET `/rest/api/get_info`, необходимо создать Issue в котором указать:

1. Какой метод необходимо исправить.
2. Текст с `{ "message": "Already started" }` на `{ "message": "Running"}`.
3. Issue поставить label: feature.

### Ответ: 

![gitlab-1](assets/img/gitlab-1.png)

### Developer

Пришёл новый Issue на доработку, вам нужно:

1. Создать отдельную ветку, связанную с этим Issue.
2. Внести изменения по тексту из задания.
3. Подготовить Merge Request, влить необходимые изменения в `master`, проверить, что сборка прошла успешно.


### Ответ: 

Создать отдельную ветку.
 ![gitlab-2](assets/img/gitlab-2.png)

Внести изменения по тексту из задания.
 ![gitlab-3](assets/img/gitlab-3.png)

Merge Request
![gitlab-4](assets/img/gitlab-4.png)


### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.
2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

### Ответ: 

![gitlab-5](assets/img/gitlab-5.png)

## Итог


- файл [gitlab-ci.yml](repository/.gitlab-ci.yml);
- [Dockerfile](repository/Dockerfile); 
- лог успешного выполнения пайплайна;[deploy](repository/log-deploy.txt) [test](repository/log-test.txt)
- решённый Issue.
![gitlab-6](assets/img/gitlab-6.png)



