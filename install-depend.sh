#!/bin/sh

DESTDIR=/tmp/qiperf 


opkg install -o ${DESTDIR} libgcc1_13.3.0-r4_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libc_1.2.5-r4_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libpthread_1.2.5-r4_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} librt_1.2.5-r4_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libstdcpp6_13.3.0-r4_aarch64_cortex-a53.ipk
opkg install -o ${DESTDIR} zlib_1.3.1-r1_aarch64_cortex-a53.ipk
opkg install -o ${DESTDIR} libffi_3.4.7-r1_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libattr_2.5.2-r3_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libpcre2_10.42-r1_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} glib2_2.82.0-r1_aarch64_cortex-a53.ipk
opkg install -o ${DESTDIR} libopenssl3_3.0.17-r1_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libatomic1_13.3.0-r4_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} botan_2.19-r5_aarch64_cortex-a53.ipk
opkg install -o ${DESTDIR} libpcre2-16_10.42-r1_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libevdev_1.13.4-r1_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libudev-zero_1.0.3-r2_aarch64_cortex-a53.ipk 
opkg install -o ${DESTDIR} libjpeg-turbo_3.0.3-r1_aarch64_cortex-a53.ipk
