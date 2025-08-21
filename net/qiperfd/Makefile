#
# Copyright (C) 2025 jimmy yeh
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qiperfd
PKG_VERSION:=0.14
PKG_RELEASE:=11408.20

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/coolshou/qiperf.git
# which git commit should we use
PKG_SOURCE_VERSION:=dc60734bde0b1cc08f11805aeae146fe583f9c94
PKG_BUILD_DIR=$(BUILD_DIR)/qiperfd-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=0
PKG_USE_MIPS16:=0
PKG_BUILD_DEPENDS:=openssl botan qt5
PKG_MAINTAINER:=Jimmy

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

define Package/qiperfd/default
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=qiperfd
	TITLE:=qiperfd
	URL:=https://github.com/coolshou/qiperf
endef

define Package/qiperfd
	$(Package/qiperfd/default)
	DEPENDS:= +qt5-core +qt5-network +qt5-widgets +qt5-websockets +qt5-serialport
endef

define Package/qiperfd/description
	qiperfd is a daemon which control iperf2/3.
endef

define Package/qiperfd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/qiperfd.init $(1)/etc/init.d/qiperfd
	$(INSTALL_DIR) $(1)/etc/xdg/alphanetworks
	$(INSTALL_BIN) ./files/qiperfd.ini $(1)/etc/xdg/alphanetworks/qiperfd.ini 
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Release/qiperfd $(1)/usr/sbin/qiperfd
	$(INSTALL_DIR) $(1)/usr/sbin/linux
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qiperfd/linux/$(ARCH)-$(TARGET_SUFFIX)/iperf3 $(1)/usr/sbin/linux
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qiperfd/linux/$(ARCH)-$(TARGET_SUFFIX)/iperf2.2.n $(1)/usr/sbin/linux
	#$(TARGET_ARCH_PACKAGES)_$(TARGET_SUFFIX)
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/qiperfd/linux/
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR)/lib/qssh; \
		qmake BOTANINCPATH=$(TOOLCHAIN_DIR)/include/botan-2 \
		BOTANPATH=$(TOOLCHAIN_DIR)/lib \
		"QMAKE_CXXFLAGS+=-fpermissive" \
		QMAKESPEC=$(TOOLCHAIN_DIR)/bin/mkspecs/linux-openwrt-g++/ \
	)
	( cd $(PKG_BUILD_DIR)/qiperfd ; \
		qmake BOTANPATH=$(TOOLCHAIN_DIR)/lib \
		"QMAKE_CXXFLAGS+=-fpermissive" \
		QMAKESPEC=$(TOOLCHAIN_DIR)/bin/mkspecs/linux-openwrt-g++/ \
	)
endef

define Build/Compile
	TARGET_CC="$(TARGET_CROSS)gcc" \
	TARGET_CXX="$(TARGET_CROSS)g++" \
	TARGET_AR="$(TARGET_CROSS)ar cqs" \
	TARGET_OBJCOPY="$(TARGET_CROSS)objcopy" \
	TARGET_RANLIB="$(TARGET_CROSS)ranlib" \
	TARGET_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS) -ldl -lpthread -lrt" \
	TARGET_INCDIRS="$(TARGET_INCDIRS)" \
	TARGET_LIBDIRS="$(TARGET_LIBDIRS) $(STAGING_DIR)/usr/lib/" \
	STAGING_DIR="$(STAGING_DIR)" \
	STAGING_DIR_HOST="$(STAGING_DIR)/../host" \
	PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	$(MAKE) -j4 -C $(PKG_BUILD_DIR)/lib/qssh; \
	$(MAKE) -j4 -C $(PKG_BUILD_DIR)/qiperfd;
endef

$(eval $(call BuildPackage,qiperfd))
