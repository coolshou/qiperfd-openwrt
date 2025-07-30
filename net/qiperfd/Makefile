#
# Copyright (C) 2025 jimmy yeh
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qiperfd
PKG_VERSION:=0.13
PKG_RELEASE:=11407.03
PKG_MD5SUM:=243657483fc3e8bead7e37663fb0a081

# package should include git submodule!!
PKG_SOURCE:=qiperf-$(PKG_VERSION).$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=https://github.com/coolshou/qiperf/archive/refs/tags/$(PKG_VERSION).$(PKG_RELEASE).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/qiperf-$(PKG_VERSION).$(PKG_RELEASE)
PKG_BUILD_PARALLEL:=0
PKG_USE_MIPS16:=0
PKG_BUILD_DEPENDS:= qt5
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
	$(INSTALL_BIN) ./files/qiperfd.init $(1)/etc/init.d/qiperfd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qiperfd $(1)/usr/sbin/qiperfd
endef

define Build/Configure
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/mkspecs/linux-openwrt-g++
	$(CP) ./files/qplatformdefs.h $(PKG_BUILD_DIR)/mkspecs/linux-openwrt-g++/qplatformdefs.h
	$(CP) ./files/qmake.conf $(PKG_BUILD_DIR)/mkspecs/linux-openwrt-g++/qmake.conf
	$(SED) 's@$$$$(TARGET_CROSS)@$(TARGET_CROSS)@g' $(PKG_BUILD_DIR)/mkspecs/linux-openwrt-g++/qmake.conf
	(cd $(PKG_BUILD_DIR)/qiperfd ; \
	TARGET_CC="$(TARGET_CROSS)gcc" \
	TARGET_CXX="$(TARGET_CROSS)g++" \
	TARGET_AR="$(TARGET_CROSS)ar cqs" \
	TARGET_OBJCOPY="$(TARGET_CROSS)objcopy" \
	TARGET_RANLIB="$(TARGET_CROSS)ranlib" \
	TARGET_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS) -lpthread -lrt" \
	TARGET_INCDIRS="$(TARGET_INCDIRS)" \
	TARGET_LIBDIRS="$(TARGET_LIBDIRS) $(STAGING_DIR)/usr/lib/" \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	qmake
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
	$(MAKE) -j4 -C $(PKG_BUILD_DIR);
endef

$(eval $(call BuildPackage,qiperfd))
