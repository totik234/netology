Role Name
=========
lighthouse role


Role Variables
--------------

| Переменная        | Описание                                                                    |
| :---------------- | :-------------------------------------------------------------------------- |
| `lighthouse_repo` | Репозиторий `lighthouse`. Например: https://github.com/VKCOM/lighthouse.git |
| `lighthouse_dir`  | Путь где будет находиться `lighthouse`. Например: `/opt/lighthouse`         |



Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: lighthouse}

