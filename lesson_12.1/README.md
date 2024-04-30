# Домашнее задание к занятию «Базовые объекты K8S»

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

### Ответ:
---
Файл манифест [kube-1.yml](assets/manifests/kube-1.yml)

![pod-1](assets/img/pod-1.png)

![pod-2](assets/img/pod-2.png)

---

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

### Ответ:
---
Файл манифест [kube-2.yml](assets/manifests/kube-2.yml)

![pod-3](assets/img/pod-3.png)

![pod-4](assets/img/pod-4.png)

---

