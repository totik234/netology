## Описание файла `terraform/.gitignore`

Будут исключены файлы переопределения конфигураций, состояний, переменных, crash логи
-
Содержание файла:
```gitignore
**/.terraform/*
*.tfstate
*.tfstate.*
crash.log
crash.*.log
*.tfvars
*.tfvars.json
override.tf
override.tf.json
*_override.tf
*_override.tf.json
.terraformrc
terraform.rc
```
