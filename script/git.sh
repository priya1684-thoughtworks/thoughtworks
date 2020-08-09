#!/bin/sh
apt-get install git -y
sudo useradd -r -m -U -d /home/ubuntu -s /bin/bash git
#su - newgit
#sudo passwd testgit
#cd /u01/opt/newgit
#sudo -u newgit mkdir -p ~/.ssh && chmod 0700 ~/.ssh
echo -e "DEvops@123\nDEvops@123" | passwd git
su -c "mkdir -p ~/.ssh && chmod 0777 ~/.ssh" git
su -c "touch ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys" git
git init --bare /home/ubuntu/git/thoughtworks.git

