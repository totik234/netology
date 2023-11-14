Role Name
=========
Vector role


Role Variables
--------------
| Переменная          | Описание                                                             |
| :------------------ | :------------------------------------------------------------------- |
| `vector_version`    | Версия `vector`. Например: `0.32.1`                                  |
| `vector_config_dir` | Путь где будет находиться файл конфигурации. Например: `/etc/vector` |


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: vector}
