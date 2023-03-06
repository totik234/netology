

## Задание

1. Узнайте о [sparse-файлах](https://ru.wikipedia.org/wiki/%D0%A0%D0%B0%D0%B7%D1%80%D0%B5%D0%B6%D1%91%D0%BD%D0%BD%D1%8B%D0%B9_%D1%84%D0%B0%D0%B9%D0%BB) (разряженных).
   
   ---
   ### Ответ:
   *Ознакомился*

   ---
2. Могут ли файлы, являющиеся жёсткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?
   
   ---
   ### Ответ:
   *Не могут, так как жесткие ссылки имеют один и тот же `inode` что и обект*

   ---

3. Сделайте `vagrant destroy` на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:

    ```ruby
    path_to_disk_folder = './disks'

    host_params = {
        'disk_size' => 2560,
        'disks'=>[1, 2],
        'cpus'=>2,
        'memory'=>2048,
        'hostname'=>'sysadm-fs',
        'vm_name'=>'sysadm-fs'
    }
    Vagrant.configure("2") do |config|
        config.vm.box = "bento/ubuntu-20.04"
        config.vm.hostname=host_params['hostname']
        config.vm.provider :virtualbox do |v|

            v.name=host_params['vm_name']
            v.cpus=host_params['cpus']
            v.memory=host_params['memory']

            host_params['disks'].each do |disk|
                file_to_disk=path_to_disk_folder+'/disk'+disk.to_s+'.vdi'
                unless File.exist?(file_to_disk)
                    v.customize ['createmedium', '--filename', file_to_disk, '--size', host_params['disk_size']]
                end
                v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', disk.to_s, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
            end
        end
        config.vm.network "private_network", type: "dhcp"
    end
    ```

    Эта конфигурация создаст новую виртуальную машину с двумя дополнительными неразмеченными дисками по 2,5 Гб.

   ---
   ### Ответ:
   Измененный *Vagrantfile*

   ![vagrant](assets/img/vagrant.png)

   Новые диски в системе

   ![new-disks](assets/img/new-disks.png)

   ---

4. Используя `fdisk`, разбейте первый диск на два раздела: 2 Гб и оставшееся пространство.

   ---
   ### Ответ:
   Саздание разделов с помощью `fdisk`

   ![fdisk-create](assets/img/fdisk-create.png)

   Новые разделы

   ![new-part](assets/img/new-part.png)

   ---

5. Используя `sfdisk`, перенесите эту таблицу разделов на второй диск.
   
   ---
   ### Ответ:

   Перенос разделов

   ![mv-part](assets/img/mv-part.png)

   ![mv-new-part](assets/img/mv-new-part.png)

   ---

6. Соберите `mdadm` RAID1 на паре разделов 2 Гб.
   
   ---
   ### Ответ:

   ![create-raid1](assets/img/create-raid1.png)
   
   ---

7. Соберите `mdadm` RAID0 на второй паре маленьких разделов.
   
   ---
   ### Ответ:

   ![create-raid0](assets/img/create-raid0.png)

   ---

8. Создайте два независимых PV на получившихся md-устройствах.
   
   ---
   ### Ответ:

   ![create-pv](assets/img/create-pv.png)

   ---

9.  Создайте общую volume-group на этих двух PV.

   ---
   ### Ответ:

   ![create-vg](assets/img/create-vg.png)

   ---

10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

   ---
   ### Ответ:
   
   ![create-lv](assets/img/create-lv.png)

   ---

11. Создайте `mkfs.ext4` ФС на получившемся LV.

   ---
   ### Ответ:
   
   ![mkfs](assets/img/mkfs.png)

   ![mkfs-blkid](assets/img/mkfs-blkid.png)

   ---

12. Смонтируйте этот раздел в любую директорию, например, `/tmp/new`.

   ---
   ### Ответ:
   
   ![mount-fstab](assets/img/mount-fstab.png)

   ![mount-cli](assets/img/mount-cli.png)

   Так же можно воспользоваться `mount /dev/vg-netology/lv-netology/tmp/new `, но тогда после перезагрузки нужно будет монтировать заново.
   
   ---

13. Поместите туда тестовый файл, например, `wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz`.

   ---
   ### Ответ:
   У меня возникли проблемы с со скачиванием файла
   ![wget](assets/img/wget.png)

   Поэтому я воспользовался плагином `vagrant scp`

   ---

14. Прикрепите вывод `lsblk`.

   ---
   ### Ответ:

   ![lsblk-with-raids](assets/img/lsblk-with-raids.png)

   ---

15. Протестируйте целостность файла:

    ```bash
    root@vagrant:~# gzip -t /tmp/new/test.gz
    root@vagrant:~# echo $?
    0
    ```

   ---
   ### Ответ:
   ![check-gz-raid0](assets/img/check-gz-raid0.png)

   ---

16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

   ---
   ### Ответ:
   ![pvmove-0-1](assets/img/pvmove-0-1.png)

   ---

17. Сделайте `--fail` на устройство в вашем RAID1 md.

   ---
   ### Ответ:

   ![mdadm-fail](assets/img/mdadm-fail.png)
   
   ---

18. Подтвердите выводом `dmesg`, что RAID1 работает в деградированном состоянии.

   ---
   ### Ответ:

   ![dmesg-raid1](assets/img/dmesg-raid1.png)
   
   ---

19. Протестируйте целостность файла — он должен быть доступен несмотря на «сбойный» диск:

    ```bash
    root@vagrant:~# gzip -t /tmp/new/test.gz
    root@vagrant:~# echo $?
    0
    ```
   ---

   ### Ответ:
   ![check-gz-raid1](assets/img/check-gz-raid1.png)

   ---

20. Погасите тестовый хост — `vagrant destroy`.

   ---
   ### Ответ:
   *Погасил.*
   
   ---