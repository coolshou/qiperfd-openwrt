#!/bin/sh

DESTDIR=/tmp/qiperf 
if [ ! -e ${DESTDIR}/var/lock/ ]; then
  mkdir -p ${DESTDIR}/var/lock/
fi


./install-depend.sh

opkg install -o ${DESTDIR} qt5-core_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-network_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-serialport_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-websockets_5.15-r17_aarch64_cortex-a53.ipk  \
	qt5-widgets_5.15-r17_aarch64_cortex-a53.ipk
opkg install -o ${DESTDIR} qiperfd_*.ipk

#ln -s ${DESTDIR}/usr/sbin/qiperfd /usr/sbin/
#ln -s ${DESTDIR}/etc/init.d/qiperfd /etc/init.d/
if [ ! -e /etc/xdg/alphanetworks ]; then
	mkdir -p /etc/xdg/alphanetworks
fi
if [ ! -e /etc/xdg/alphanetworks/qiperfd.ini ];then
	ln -sf ${DESTDIR}/etc/xdg/alphanetworks/qiperfd.ini /etc/xdg/alphanetworks/qiperfd.ini
fi