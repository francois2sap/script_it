sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

sudo mysql -h127.0.0.1 -P3306 -uroot -e"UPDATE mysql.user SET password = PASSWORD('0000') WHERE user = 'root'"
