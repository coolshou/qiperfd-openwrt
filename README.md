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

5. install (in device, temporary, will not exist after reboot)

```
mkdir /tmp/qiperf
cd /tmp/qiperf
wget http://192.168.1.47:8888/qiperfd-0.15.11408.25.tar
tar xvf qiperfd-0.15.11408.25.tar
./install.sh
```

6. config vi /etc/xdg/alphanetworks/qiperfd.ini
   change ifname=br-lan to the interface which will broadcast device info
7. run qiperfd

   ```
   ./run.sh
   ```
