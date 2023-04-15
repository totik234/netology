# Домашнее задание к занятию «Использование Python для решения типовых DevOps-задач»

------

## Задание 1

Есть скрипт:

```python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```

### Вопросы:

| Вопрос  | Ответ |
| ------------- | ------------- |
| Какое значение будет присвоено переменной `c`?  | `TypeError: unsupported operand type(s) for +: 'int' and 'str' ` получим ошибку с неправильными типами т.к. переменная `a` имеет тип целочисленное, а переменная `b` строковый тип |
| Как получить для переменной `c` значение 12?  | `c = str(a) + b` нужно привести явно переменную `a` к строковому типу данных |
| Как получить для переменной `c` значение 3?  | `c = a + int(b)` нужно привести явно переменную `b` к целочисленному типу данных |

------

## Задание 2

Мы устроились на работу в компанию, где раньше уже был DevOps-инженер. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. 

Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ./","git status"]
result_os = os.popen(' && '.join(bash_command)).read()

for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
```

### Вывод скрипта при запуске во время тестирования:

```zsh
➜  netology git:(main) ✗ /usr/local/bin/python3 /Users/dshulc/Study/netology/lesson_4.1/main.py
lesson_4.1/README.md
```

------

## Задание 3

Доработать скрипт выше так, чтобы он не только мог проверять локальный репозиторий в текущей директории, но и умел воспринимать путь к репозиторию, который мы передаём, как входной параметр. Мы точно знаем, что начальство будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:

```python
#!/usr/bin/env python3

import os
import sys

path = "./"

if len(sys.argv) >= 2:
    path = sys.argv[1]
    if not os.path.isdir(path):
        sys.exit("Directory doesn't exist: " + path)

bash_command = ["cd " + path, "git status 2>&1"]
git_command = ["git rev-parse --show-toplevel"]


result_os = os.popen(' && '.join(bash_command)).read()
if result_os.find('not a git') != -1:
    sys.exit("not a git repository: " + path)

git_top_level = (os.popen(' && '.join(git_command)).read()).replace('\n', '/')

for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(git_top_level + prepare_result)

```

### Вывод скрипта при запуске во время тестирования:

без аргументов
```zsh
➜  netology git:(main) ✗ /usr/local/bin/python3 /Users/dshulc/Study/netology/lesson_4.1/main.py
/Users/dshulc/Study/netology/lesson_4.1/README.md
```

с аргументами
```zsh
➜  netology git:(main) ✗ /usr/local/bin/python3 /Users/dshulc/Study/netology/lesson_4.1/main.py /Users/dshulc/Study/netology/
/Users/dshulc/Study/netology/lesson_4.1/README.md
```
------

## Задание 4

Наша команда разрабатывает несколько веб-сервисов, доступных по HTTPS. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. 

Проблема в том, что отдел, занимающийся нашей инфраструктурой, очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS-имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. 

Мы хотим написать скрипт, который: 

- опрашивает веб-сервисы; 
- получает их IP; 
- выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. 

Также должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена — оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: `drive.google.com`, `mail.google.com`, `google.com`.

### Ваш скрипт:

```python
import socket
import time

service_addr = {
    'drive.google.com': '0',
    'mail.google.com': '0',
    'google.com': '0'
}

for item in service_addr:
    initial_addr = socket.gethostbyname(item)
    service_addr[item] = initial_addr

while True:
    for item in service_addr:
        old_addr = service_addr[item]
        new_addr = socket.gethostbyname(item)
        if new_addr != old_addr:
            service_addr[item] = new_addr
            print("[ERROR] "+item+" IP mismatch: old IP "+old_addr+", new IP "+new_addr)
        print(item + " - " + service_addr[item])
    print("######################################")
    time.sleep(10)
```

### Вывод скрипта при запуске во время тестирования:

```
######################################
drive.google.com - 64.233.162.194
mail.google.com - 173.194.222.19
google.com - 108.177.14.139
######################################
drive.google.com - 64.233.162.194
mail.google.com - 173.194.222.19
google.com - 108.177.14.139
######################################
drive.google.com - 64.233.162.194
mail.google.com - 173.194.222.19
google.com - 108.177.14.139
######################################
drive.google.com - 64.233.162.194
mail.google.com - 173.194.222.19
google.com - 108.177.14.139
######################################
drive.google.com - 64.233.162.194
mail.google.com - 173.194.222.19
google.com - 108.177.14.139
######################################
[ERROR] drive.google.com IP mismatch: old IP 64.233.162.194, new IP 216.58.212.142
drive.google.com - 216.58.212.142
[ERROR] mail.google.com IP mismatch: old IP 173.194.222.19, new IP 142.250.185.165
mail.google.com - 142.250.185.165
[ERROR] google.com IP mismatch: old IP 108.177.14.139, new IP 172.217.18.14
google.com - 172.217.18.14
######################################
[ERROR] drive.google.com IP mismatch: old IP 216.58.212.142, new IP 64.233.162.194
drive.google.com - 64.233.162.194
[ERROR] mail.google.com IP mismatch: old IP 142.250.185.165, new IP 64.233.165.18
mail.google.com - 64.233.165.18
[ERROR] google.com IP mismatch: old IP 172.217.18.14, new IP 64.233.161.101
google.com - 64.233.161.101
######################################
```

------
