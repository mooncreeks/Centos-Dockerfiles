############################################################
# Dockerfile to build ssh Base Container
# Based on: centos:centos7
# DATE: 11/06/2015
# Author: Alex Yin - name@example.com 
############################################################
# Set the base image
FROM centos:centos7

# File Author /Maintainer
MAINTAINER Alex YIN <mooncreeks@gmail.com>

# Install ssh service
RUN yum -y update; yum clean all
RUN yum install -y openssh-server passwd; yum clean all
ADD ./start.sh /start.sh
RUN mkdir -p /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh

#port
EXPOSE 22

#
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd","-D"]
