Get a bash:
```shell
python -c 'import pty;pty.spawn("/bin/bash")'
```

Getting useful info:
```shell
find /home -printf "%f\t%p\t%u\t%g\t%m\n" 2>/dev/null | column -t
```
Cut passwd to users.txt:
```shell
cat passwd | grep 'bin/bash' | cut -d: -f1
```
Direct transfer to clipboard
```shell
cat /usr/share/exploitdb/exploits/linux/local/14339.sh|xclip
```


For run firefox command line and without keep terminal
/usr/bin/firefox hk.yahoo.com &

Custom commands for linux terminal

```shell
$ nano .bashrc 

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
```
**search NSE**
```shell
locate -r '\.nse$' | grep 'smb\|ssl'
```
