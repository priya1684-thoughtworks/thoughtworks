#!/bin/bash

installdependencies()

{

echo “Install script for Jenkins Server”;

echo “Installing Dependencies”;

sudo apt-get install firewalld
#apt-get install -y epel-release

firewall-cmd — add-port=8080/tcp — permanent — zone=public

firewall-cmd — reload

setenforce 0

sed -i ‘s/SELINUX=enforcing/SELINUX-disabled/g’ /etc/selinux/config

sudo apt-get install openjdk-8-jre

}

installJenkins()

{

echo “Dependencies installed now Jenkins will be installed”

curl — silent — location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

rpm — import https://jenkins-ci.org/redhat/jenkins-ci.org.key

apt-get install -y jenkins

echo “starting and enabling jenkins”

systemctl start jenkins

systemctl enable jenkins

}

installdependencies

installJenkins

echo “Jenkins installed now open your browser and navigate to http://your_ip_or_domain:8080"

cat /var/lib/jenkins/secrets/initialAdminPassword

echo “copy the initial password to unlock and start accessing jenkins”
