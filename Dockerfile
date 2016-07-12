# Latest version of centos6.6
FROM centos:centos6.6
MAINTAINER humangas
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip && \
    yum -y install ansible && \
    yum -y install tar && \
    yum -y install openssh-server 
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

