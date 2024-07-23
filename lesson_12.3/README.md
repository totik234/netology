# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»


------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

### Ответ:
---
Файл [deployment.yml](kube/deployment.yaml)

Результат:
![kube-1](assets/img/kube-1.png)


Файл [service_internal.yaml](kube/service_internal.yaml)

Результат:
![kube-2](assets/img/kube-2.png)


Файл [pod_multitool_client.yaml](kube/pod_multitool_client.yaml)

Результат:
![kube-3](assets/img/kube-3.png)

Проверяем доступность из pod

**nginx**
```bash
kubectl exec -it pod/multitool-client -- curl netology-app-service:9001
```
![kube-4](assets/img/kube-4.png)

**moltitool**
```bash
kubectl exec -it pod/multitool-client -- curl netology-app-service:9002
```
![kube-5](assets/img/kube-5.png)

---

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

### Ответ:
---
Файл [service_external.yaml](kube/service_external.yaml)

Результат:
![kube-6](assets/img/kube-6.png)

Демонстрация доступности с локального компьютера
![kube-7](assets/img/kube-7.png)

---