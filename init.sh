#!/bin/sh
if [ ! -f /aria2/conf/aria2.conf ]; then
	cp /aria2/conf-temp/aria2.conf /aria2/conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /aria2/conf/aria2.conf
	fi
fi
if [ ! -f /aria2/conf/on-complete.sh ]; then
	cp /aria2/conf-temp/on-complete.sh /aria2/conf/on-complete.sh
fi
if [ ! -f /aria2/conf/delete.sh ]; then
	cp /aria2/conf-temp/delete.sh /aria2/conf/delete.sh
fi
if [ ! -f /aria2/conf/tracker.sh ]; then
	cp /aria2/conf-temp/tracker.sh /aria2/conf/tracker.sh
fi

chmod +x /aria2/conf/on-complete.sh
chmod +x /aria2/conf/delete.sh
chmod +x /aria2/conf/tracker.sh
touch /aria2/conf/aria2.session

source /aria2/conf/tracker.sh

darkhttpd /aria-ng --port 80 &
aria2c --conf-path=/aria2/conf/aria2.conf
