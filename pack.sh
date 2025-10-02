#!/bin/sh

#VERSION=0.17.11409.22
PKG_VERSION=$(grep '^PKG_VERSION:=' net/qiperfd/Makefile | cut -d'=' -f2 | xargs)
PKG_RELEASE=$(grep '^PKG_RELEASE:=' net/qiperfd/Makefile | cut -d'=' -f2 | xargs)
VERSION=$PKG_VERSION.$PKG_RELEASE
#echo "VERSION $VERSION"

BASEDIR=../mt7988/openwrt-24.10
OUTDIR=/home/jimmy/SOFT/work/qiperf-release.git/$VERSION
if [ ! -e $OUTDIR ]; then
 mkdir -p $OUTDIR
fi

ARCH=aarch64_cortex-a53
CPU_ARCH="${ARCH%%_*}"
#echo "CPU_ARCH $CPU_ARCH"

SOURCEDIR=$BASEDIR/bin/packages/$ARCH/

tar -cvf $OUTDIR/openwrt-qiperfd-${VERSION}_$CPU_ARCH.tar \
	--transform='s|.*/||' \
	install.sh \
	install-depend.sh \
	uninstall-depend.sh \
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
