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
PKG_MD5SUM:=39467a8ea4951256e50f7c86f502e855

PKG_SOURCE:=qiperf-$(PKG_VERSION).$(PKG_RELEASE).tar.gz qt-everywhere-opensource-src-$(PKG_VERSION).$(PKG_RELEASE).tar.xz
PKG_SOURCE_URL:=https://github.com/coolshou/qiperf/archive/refs/tags/$(PKG_VERSION).$(PKG_RELEASE).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/qiperf-$(PKG_VERSION).$(PKG_RELEASE)
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
PKG_BUILD_DEPENDS:= qt5
PKG_MAINTAINER:=Jimmy

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

define Package/$(PKG_NAME)/default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=qiperfd - Quick iperf daemon
  URL:=https://github.com/coolshou/qiperf
endef

define Package/$(PKG_NAME)
  $(Package/qiperfd/default)
  DEPENDS:= +qt5-core +qt5-network +qt5-widgets +qt5-websockets +qt5-serialport
endef

define Package/$(PKG_NAME)/description
 qiperfd is a daemon which control iperf2/3.
endef

define Package/$(PKG_NAME)/install
  $(INSTALL_BIN) ./files/qiperfd.init $(1)/etc/init.d/qiperfd
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/qiperfd $(1)/usr/sbin/qiperfd
endef

define Build/Configure
    qmake
endef

define Build/Compile
    $(MAKE) -j4 -C $(PKG_BUILD_DIR)
endef

$(eval $(call BuildPackage,qiperfd))
