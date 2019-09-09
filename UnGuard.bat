netsh firewall set opmode mode=DISABLE 
sc stop WinDefend 
sc config wuauserv start= disabled
