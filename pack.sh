#!/bin/sh

VERSION=0.15.11408.25
BASEDIR=/home/jimmy/SOFT/test_driver/openwrt/mt7988/openwrt-24.10
ARCH=aarch64_cortex-a53
SOURCEDIR=$BASEDIR/bin/packages/$ARCH/

tar -cvf qiperfd-$VERSION.tar \
	--transform='s|.*/||' \
	install.sh \
	install-depend.sh \
	uninstall-qt.sh \
	uninstall.sh \
	run.sh \
	update.sh \
	$BASEDIR/bin/targets/mediatek/filogic/packages/libc_1.2.5-r4_$ARCH.ipk \
	$BASEDIR/bin/targets/mediatek/filogic/packages/librt_1.2.5-r4_$ARCH.ipk \
	$SOURCEDIR/base/zlib_1.3.1-r1_$ARCH.ipk \
	$BASEDIR/bin/targets/mediatek/filogic/packages/libstdcpp6_13.3.0-r4_$ARCH.ipk \
	$BASEDIR/bin/targets/mediatek/filogic/packages/libgcc1_13.3.0-r4_$ARCH.ipk \
	$BASEDIR/bin/targets/mediatek/filogic/packages/libpthread_1.2.5-r4_$ARCH.ipk \
	$SOURCEDIR/packages/libffi_3.4.7-r1_$ARCH.ipk \
	$SOURCEDIR/packages/libattr_2.5.2-r3_$ARCH.ipk \
	$SOURCEDIR/base/libpcre2_10.42-r1_$ARCH.ipk \
	$SOURCEDIR/packages/glib2_2.82.0-r1_$ARCH.ipk \
	$SOURCEDIR/base/libopenssl3_3.0.17-r1_$ARCH.ipk \
	$BASEDIR/bin/targets/mediatek/filogic/packages/libatomic1_13.3.0-r4_$ARCH.ipk \
	$SOURCEDIR/botan/*.ipk \
	$SOURCEDIR/base/libpcre2-16_10.42-r1_$ARCH.ipk \
	$SOURCEDIR/packages/libevdev_1.13.4-r1_$ARCH.ipk \
	$SOURCEDIR/packages/libudev-zero_1.0.3-r2_$ARCH.ipk \
	$SOURCEDIR/packages/libjpeg-turbo_3.0.3-r1_$ARCH.ipk \
	$SOURCEDIR/libqt/*.ipk \
	$SOURCEDIR/qiperfd/*.ipk
