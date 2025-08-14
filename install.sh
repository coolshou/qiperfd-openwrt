#!/bin/sh

mkdir -p /tmp/qiperf/var/lock/

./install-depend.sh

opkg install -o /tmp/qiperf qt5-core_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-network_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-serialport_5.15-r17_aarch64_cortex-a53.ipk \
	qt5-websockets_5.15-r17_aarch64_cortex-a53.ipk  \
	qt5-widgets_5.15-r17_aarch64_cortex-a53.ipk
opkg install -o /tmp/qiperf qiperfd_0.14-r11408.08_aarch64_cortex-a53.ipk

#ln -s /tmp/qiperf/usr/sbin/qiperfd /usr/sbin/
#ln -s /tmp/qiperf/etc/init.d/qiperfd /etc/init.d/

