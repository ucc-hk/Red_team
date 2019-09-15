netsh advfirewall set allprofiles state off
sc config WinDefend start= disabled
sc stop WinDefend 
sc config wuauserv start= disabled
