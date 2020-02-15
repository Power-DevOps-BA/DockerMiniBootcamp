docker volume create wpdb

docker run -d --rm --name wpdb --network wordpress -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=my-secret-pw \
-e MYSQL_USER=wpuser \
-e MYSQL_PASSWORD=my-secret-pw \
-e MYSQL_DATABASE=wordpressdb \
-v wpdb:/var/lib/mysql \
mysql:5.7

mysql -h 127.0.0.1 -u wpuser -pmy-secret-pw

docker run -d --rm -p 8080:80 --name wpweb --network wordpress \
-e WORDPRESS_DB_HOST=wpdb:3306 \
-e WORDPRESS_DB_USER=wpuser \
-e WORDPRESS_DB_PASSWORD=my-secret-pw \
-e WORDPRESS_DB_NAME=wordpressdb \
-e WORDPRESS_TABLE_PREFIX=hj \
wordpress:latest

