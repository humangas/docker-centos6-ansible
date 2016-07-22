# [docker-centos6-ansible](https://hub.docker.com/r/humangas/centos6-ansible/)
See Also: [Docker Hub: humangas/centos6-ansible](https://hub.docker.com/r/humangas/centos6-ansible/)

Dockerfile for ansible in a docker on CentOS 6  
For centos6 to [ansible/ansible-docker-base](https://github.com/ansible/ansible-docker-base) did not exist, it was created.

## Caution!!
Only, is the server for testing the ansible. Therefore, please do not use as it is for your production. Security settings of ssh is loose.
For more information, please refer to the Dockerfile.


# Usage
It has been described an example of up to flow a sample of Ansible playbook.

## Preparation: Obtain the Ansible Playbook sample
```
$ mkdir ~/work && cd ~/work
$ git clone https://github.com/humangas/ansible-base.git
```

## Directly, to login to the Docker container
```
$ docker run -it -p 2222:22 -v ~/work/ansible-base:/tmp/ansible humangas/centos6-ansible /bin/bash
[root@xxx /]# cd /tmp/ansible
[root@xxx ansible]# ansible-playbook site.yml -c local
```

## Log in with SSH 
```
$ docker run -d -p 2222:22 -v ~/work/ansible-base:/tmp/ansible humangas/centos6-ansible /usr/sbin/sshd -D
$ ssh -p 2222 root@localhost -o "StrictHostKeyChecking no"
[root@xxx /]# cd /tmp/ansible
[root@xxx ansible]# ansible-playbook site.yml -c local
```

## Run directly Playbook from the host 
```
$ docker run -d -p 2222:22 -v ~/work/ansible-base:/tmp/ansible humangas/centos6-ansible /usr/sbin/sshd -D
$ cat ~/work/ansible-base/hosts
# Remove the comments of "ansible_ssh_port" and "ansible_ssh_user"
[local]
localhost

[local:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_port=2222
ansible_ssh_user=root

$ ansible-playbook site.yml
```

