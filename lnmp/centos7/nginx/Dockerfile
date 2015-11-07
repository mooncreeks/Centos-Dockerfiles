############################################################
# Dockerfile to build nginx Base Container
# Based on: centos:centos7
# DATE: 10/29/2015
# Author: Alex Yin - name@example.com
# COPYRIGHT: Centling Technologies Co.Ltd.
############################################################
FROM nginx:1.9

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
RUN  mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx
RUN  chown -R www-data.www-data /opt/htdocs /opt/log

VOLUME ["/opt"]
