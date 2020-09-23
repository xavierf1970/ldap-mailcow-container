#!/bin/ash

cp $CACERT_PATH /usr/share/ca-certificates/;
echo `basename $CACERT_PATH` >> /etc/ca-certificates.conf;
update-ca-certificates;

python3 syncer.py;
