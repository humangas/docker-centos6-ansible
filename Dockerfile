# Latest version of centos6.6
FROM centos:centos6.6
MAINTAINER humangas

## ansible
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip && \
    yum -y install ansible
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

## add module
RUN yum -y install tar 

## ssh setting
RUN yum -y install openssh-server 
RUN sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN service sshd start
RUN passwd -d root
EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
