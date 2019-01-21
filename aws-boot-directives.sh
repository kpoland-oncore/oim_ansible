#!/bin/bash
# review logs at
#   /var/log/cloud-init-output.log
# commands run as root, do not need to use sudo
# commands must have flags to run non-interactively
yum update -y
# repo for ansible
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# install git and ansible
yum install -y git ansible
# configure git for me
git config --global user.name "Kyle Poland"
git config --global user.email "kyle.poland@oncorellc.com"
git config --global credential.helper store
# create an ssh key for root, trust it, and trust localhost
ssh-keygen -q -o -t rsa -b 2048 -f ~/.ssh/id_rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-keyscan localhost >> ~/.ssh/known_hosts
# copy ansible repo down
git clone https://github.com/kpoland-oncore/oim_ansible.git /var/lib/ansible
