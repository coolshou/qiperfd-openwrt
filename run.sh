#!/bin/sh

DESTDIR=/tmp/qiperf 

export LD_LIBRARY_PATH=${DESTDIR}/usr/lib
${DESTDIR}/usr/sbin/qiperfd &