#!/bin/sh

DESTDIR=/tmp/qiperf 

if [ -e ${DESTDIR} ];then
    rm /tmp/openwrt-qiperfd*.tar
fi

rm ${DESTDIR}/*.ipk

killall qiperfd
opkg remove -o ${DESTDIR} qiperfd
