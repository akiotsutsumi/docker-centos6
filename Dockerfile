#pull base image
FROM centos:centos6

# Maintainer
MAINTAINER Akio Tsutsumi <akiodeveloper@gmail.com>

# update package
RUN yum -y update

# ssh server install
RUN yum install -y openssh-server

# setting ssh
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# port setting
EXPOSE 22

# run ssh server
CMD /usr/sbin/sshd -D
