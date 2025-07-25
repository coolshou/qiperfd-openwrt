# qiperfd-openwrt
qiperfd for openwrt makefile

=========================

Installation instructions
-------------------------

1. Add feeds in feeds.conf

```
src-git qiperfd https://github.com/coolshou/qiperfd-openwrt.git
```

2. Update & install feeds

```
./scripts/feeds update -a 
./scripts/feeds install -a qiperfd
```
3. make package
```
make package/qiperfd/clean
make package/qiperfd/compile V=s 
```

ipk will be in bin\packages\<arch>\