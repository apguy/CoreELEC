# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="u-boot-tools"
PKG_VERSION="2021.10"
PKG_SHA256="cde723e19262e646f2670d25e5ec4b1b368490de950d4e26275a988c36df0bd4"
PKG_LICENSE="GPL"
PKG_SITE="https://www.denx.de/wiki/U-Boot"
PKG_URL="http://ftp.denx.de/pub/u-boot/u-boot-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_HOST="ccache:host bison:host flex:host"
PKG_LONGDESC="Das U-Boot is a cross-platform bootloader for embedded systems."

make_host() {
  if [ "${MACHINE_HARDWARE_NAME}" = "aarch64" ]; then
    make qemu_arm64_defconfig
  else
    make qemu-x86_64_defconfig
  fi
  make tools-only
}

make_target() {
  : # host-only package
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/bin
    cp tools/mkimage ${TOOLCHAIN}/bin
}
