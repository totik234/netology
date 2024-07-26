# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»


### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

### Ответ:
---
Deployment приложения _frontend_

![kube-1](assets/img/kube-1.png)

Deployment приложения _backend_ 

![kube-2](assets/img/kube-2.png)

Services

![kube-3](assets/img/kube-3.png)

Демонстрация работы внутри кластера

_frontend_

![kube-4](assets/img/kube-4.png)

_backend_

![kube-5](assets/img/kube-5.png)


Файлы манифеста:
  - [backend_deployment.yaml](kube/backend_deployment.yaml)
  - [backend_service.yaml](kube/backend_service.yaml)
  - [frontend_deployment.yaml](kube/frontend_deployment.yaml)
  - [frontend_service.yaml](kube/frontend_service.yaml)

---




### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

### Ответ:
---
_frontend_

![kube-6](assets/img/kube-6.png)

_backend_

![kube-7.png](assets/img/kube-7.png)

Файлы манифеста:
 - [ingress.yaml](kube/ingress.yaml)

---



