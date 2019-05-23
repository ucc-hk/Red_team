```shell
python -m SimpleHTTPServer 80

Show process:
ps -ef 
kill -9 <PID>
```shell
or 

This "fuser 8080/tcp" will print you PID of process bound on that port.

And this "fuser -k 8080/tcp" will kill that process.

