# qiperfd-openwrt

qiperfd for openwrt makefile

=========================

Installation instructions
-------------------------

0. Add depend Qt to feeds.conf

```
src-git libqt https://github.com/coolshou/qt-openwrt.git
src-git botan https://github.com/coolshou/botan-openwrt.git
```

1. Add feeds.conf

```
src-git qiperfd https://github.com/coolshou/qiperfd-openwrt.git
```

2. Update & install feeds

```
./scripts/feeds update -a
./scripts/feeds install -a
```

3. config : Network ---> qiperfd ---> [M]qiperfd

```
make menuconfig
```

4. make package

```
make package/qiperfd/clean
make package/qiperfd/compile V=s 
```

ipk will be in bin\packages\<arch>\

5.1. install depend lib (_XXXX is package version, _YYYY is you platform name eq: aarch64_cortex-a53)

```
opkg install botan_XXXX_YYYY.ipk \
    qt5-core_XXXX_YYYY.ipk \
    qt5-network_XXXX_YYYY.ipk \
    qt5-widgets_XXXX_YYYY.ipk \
    qt5-websockets_XXXX_YYYY.ipk \
    qt5-serialport_XXXX_YYYY.ipk 

```

5.2. install qiperfd

```
opkg install qiperfd_XXXX_YYYY.ipk
```
