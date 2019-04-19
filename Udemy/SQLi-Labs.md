root@kali-2017:~# service mysql start
root@kali-2017:~# mysql -u root -p
MariaDB [(none)]> use mysql;

GRANT ALL PRIVILEGES ON *.* TO 'alex'@'localhost' IDENTIFIED BY 'password';
root@kali-2017:~# service mysql restart

root@kali-2017:/var/www/html/sqli-labs-php7/sql-connections# 
update db-creds.inc
m
service mysql restart
root@kali-2017:/var/www/html/sqli-labs-php7/sql-connections# service apache2 start

root@kali-2017:/etc/mysql/mariadb.conf.d# vi 50-server.cnf 

uncomment:
general_log_file        = /var/log/mysql/mysql.log
general_log             = 1

root@kali-2017:/etc/mysql/mariadb.conf.d# service mysql restart
