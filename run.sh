#!/bin/sh

DESTDIR=/tmp/qiperf 
if [ ! -e ${DESTDIR} ]; then
  ln -s /mnt/ubi0_6 ${DESTDIR}
fi

export LD_LIBRARY_PATH=${DESTDIR}/usr/lib
${DESTDIR}/usr/sbin/qiperfd &