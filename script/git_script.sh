#!/bin/sh
yum install git
sudo useradd -r -m -U -d /u01/opt/newgit -s /bin/bash newgit
#su - newgit
#sudo passwd testgit
#cd /u01/opt/newgit
#sudo -u newgit mkdir -p ~/.ssh && chmod 0700 ~/.ssh
echo -e "DEvops@123\nDEvops@123" | passwd newgit
su -c "mkdir -p ~/.ssh && chmod 0700 ~/.ssh" newgit
su -c "touch ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys" newgit
git init --bare /u01/opt/newgit/testdevops.git
