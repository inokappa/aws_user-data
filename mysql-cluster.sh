#!/bin/bash
yum -y update
cd /tmp/
wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.3/MySQL-Cluster-server-gpl-7.3.3-1.el6.x86_64.rpm
wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.3/MySQL-Cluster-client-gpl-7.3.3-1.el6.x86_64.rpm
rpm -Uvh /tmp/MySQL-Cluster-*
shutdown -r now
