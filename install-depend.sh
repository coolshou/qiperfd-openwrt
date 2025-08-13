#!/bin/sh
opkg install -o /tmp/qiperf libgcc1_13.3.0-r4_aarch64_cortex-a53.ipk \
    libc_1.2.5-r4_aarch64_cortex-a53.ipk \
    libpthread_1.2.5-r4_aarch64_cortex-a53.ipk \
    librt_1.2.5-r4_aarch64_cortex-a53.ipk \
    libstdcpp6_13.3.0-r4_aarch64_cortex-a53.ipk
opkg install -o /tmp/qiperf zlib_1.3.1-r1_aarch64_cortex-a53.ipk \
	libffi_3.4.7-r1_aarch64_cortex-a53.ipk \
	libattr_2.5.2-r3_aarch64_cortex-a53.ipk \
	libpcre2_10.42-r1_aarch64_cortex-a53.ipk \
	glib2_2.82.0-r1_aarch64_cortex-a53.ipk
opkg install -o /tmp/qiperf  libopenssl3_3.0.17-r1_aarch64_cortex-a53.ipk \
	libatomic1_13.3.0-r4_aarch64_cortex-a53.ipk \
	botan_2.19-r5_aarch64_cortex-a53.ipk
opkg install -o /tmp/qiperf libpcre2-16_10.42-r1_aarch64_cortex-a53.ipk \
	libevdev_1.13.4-r1_aarch64_cortex-a53.ipk \
	libudev-zero_1.0.3-r2_aarch64_cortex-a53.ipk \
	libmariadb3_3.4.5-r1_aarch64_cortex-a53.ipk
opkg install -o /tmp/qiperf libjpeg-turbo_3.0.3-r1_aarch64_cortex-a53.ipk
