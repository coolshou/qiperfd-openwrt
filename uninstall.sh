#!/bin/sh

DESTDIR=/tmp/qiperf 

killall qiperfd
opkg remove -o ${DESTDIR} qiperfd
