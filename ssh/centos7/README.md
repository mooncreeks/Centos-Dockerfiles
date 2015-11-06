
This dockerifle reference the official version: https://github.com/CentOS/CentOS-Dockerfiles/tree/master/ssh/centos7

#1. Create sshd_centos7 dir and add two files as below:
# tree sshd_centos7/
sshd_centos7/
├── Dockerfile
└── start.sh
 
2.Build your own ssh image 
Copy the sources to your docker host and build the container:

# docker build -rm -t <username>/ssh:centos7 .

[root@iZ281hdlfydZ sshd_centos7]# docker images
REPOSITORY                       TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
mooncreeks/ssh                   centos7             905ca0a0b548        3 minutes ago       226.2 MB

3.Start the container based on the ssh image

# docker run -d -p 22 <username>/ssh:centos7

4. Get the port that the container is listening on:

# docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS                   NAMES
8c82a9287b23        <username>/ssh:centos7   /usr/sbin/sshd -D   4 seconds ago       Up 2 seconds        0.0.0.0:49154->22/tcp   mad_mccarthy        

5. To test, use the port that was just located:

# ssh -p xxxx admin@localhost 
