netsh advfirewall set allprofiles state off
sc config WinDefend start= disabled
sc stop WinDefend 
sc config wuauserv start= disabled
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
