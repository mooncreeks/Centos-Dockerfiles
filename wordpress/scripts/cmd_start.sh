#!/bin/sh
### Description: Start lnmp wordpress container
### Written by: Alex Yin - mooncreeks@gmail.com on 11-07-2015

DIR="$( cd "$( dirname "$0" )" && pwd )"

## delete container
( docker ps -a |grep 'lnmp_wordpress' >/dev/null ) && ( docker rm lnmp_wordpress )

## start container
CID=$(
docker run --name=lnmp_wordpress  \
	-it \
	-p 80:80 \
	mooncreeks/wordpress:centos7)
	/bin/bash

echo "$(docker logs $CID)"
docker ps
