#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

#create docker-data container if does not exitst
( docker ps -a |grep 'docker-data' > /dev/null )||( docker run --name docker-data -i -t mooncreeks/docker-dta /bin/bash )

#delete docker-mysql container
( docker ps -a |grep 'docker-mysql' > /dev/null )&&( docker rm docker-mysql )

#start docker-mysql container
docker run --name=docker-mysql \
	-e MYSQL_ROOT_PASSWORD="1234.abcd" \
	-e MYSQL_LOGIN="admin" \
	-e MYSQL_PASSWORD="1234.abcd" \
	--volumes-from docker-data \
	-p 3306:3306 \
	-v "$DIR"/../etc/my.cnf:/etc/my.cnf \
	-i \
	-t \
	mooncreeks/docker-mysql \
	/bin/bash

#delete docker-php-fpm container
( docker ps -a |grep 'docker-php-fpm' > /dev/null )&&( docker rm docker-php-fpm )

#start docker-php-fpm container
docker run --name=docker-php-fpm \
	-e MYSQL_ROOT_PASSWORD="1234.abcd" \
	-e MYSQL_LOGIN="admin" \
	-e MYSQL_PASSWORD="1234.abcd" \
	--link docker-mysql \
	-p 80:80 \
	-v "$DIR"/../etc/php-fpm.conf:/etc/php-fpm.conf \
	-v "$DIR"/../etc/php-fpm.d/:/etc/php-fpm.d/ \
	-v "$DIR"/../etc/php.ini:/etc/php.ini
	-i \
	-t \
	mooncreeks/docker-php-fpm \
	/bin/bash
