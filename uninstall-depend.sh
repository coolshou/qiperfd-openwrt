#!/bin/sh

DESTDIR=/tmp/qiperf 


opkg remove -o ${DESTDIR} \
    libgcc1 \
    libc \
    libpthread \
    librt \
    libstdcpp6 \
    zlib \
    libffi \
    libattr \
    libpcre2 \
    glib2 \
    libopenssl3 \
    libatomic1 \
    botan \
    libpcre2-16 \
    libevdev \
    libudev-zero \
    libjpeg-turbo 
