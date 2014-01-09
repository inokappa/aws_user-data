#!/bin/sh

SEEDIP=''

yum install -y telnet curl vim-enhanced datastax-agent

IP=`ifconfig eth0 | grep 'inet addr:' | sed -e 's/^.*inet addr://' -e 's/ .*//'`
sed -i s/SEEDIP/${SEEDIP}/g \
/usr/local/cassandra/conf/cassandra.yaml.template

sed s/IPADDRESS/${IP}/g \
/usr/local/cassandra/conf/cassandra.yaml.template > /usr/local/cassandra/conf/cassandra.yaml

if [ ! -d /var/lib/cassandra ];then
  mkdir /var/lib/cassandra
else
  mv /var/lib/cassandra /var/lib/cassandra.bk
  mkdir /var/lib/cassandra
fi

/etc/init.d/cassandra start
sleep 60
/etc/init.d/datastax-agent start
