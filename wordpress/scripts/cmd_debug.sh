#!/bin/sh
### Description: Debug lnmp_wordpress container
### Written by: Alex Yin - mooncreeks@gmail.com on 11-04-2015

DIR="$( cd "$( dirname "$0" )" && pwd )"

## create docker-data container if does not exist
#( docker ps -a |grep 'docker-data' >/dev/null ) || ( docker run --name docker-data -i -t vukor/docker-data )

## delete lnmp_wordpress container
( docker ps -a |grep 'lnmp_wordpress' >/dev/null ) && ( docker rm lnmp_wordpress )

## start lnmp_wordpress container
docker run --name=lnmp_wordpress -t -i --rm=true \
	-p 80:80 \
	-v "$DIR"/../www:/home/dev/www \
	-v "$DIR"/../logs:/home/dev/logs \
	mooncreeks/lnmp_wordpress /bin/bash
