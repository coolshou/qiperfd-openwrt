#!/bin/sh
#remove
DESTDIR=/tmp/qiperf 

opkg remove -o ${DESTDIR} \
	qt5-serialport \
	qt5-websockets \
	qt5-widgets \
	qt5-network \
	qt5-core 
	
