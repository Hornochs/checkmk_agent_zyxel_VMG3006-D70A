#!/bin/ash
cp /data/scripts/boot_script/files/check-mk-agent /etc/xinetd.d/
cp /data/scripts/boot_script/files/services /etc
killall xinetd
xinetd -pidfile /var/run/xinetd.pid
ntpd -d -p 10.0.7.1