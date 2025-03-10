# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="system-tools"
PKG_VERSION="1.0"
PKG_REV="126"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes autossh, bottom, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, lm_sensors, lshw, mc, mtpfs, nmon, p7zip, patch, pv, screen, smartmontools, stress-ng, unrar, usb-modeswitch and vim."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    autossh \
                    bottom \
                    diffutils \
                    dstat \
                    dtach \
                    encfs \
                    evtest \
                    fdupes \
                    file \
                    getscancodes \
                    hddtemp \
                    hd-idle \
                    hid_mapper \
                    htop \
                    i2c-tools \
                    inotify-tools \
                    jq \
                    lm_sensors \
                    lshw \
                    mc \
                    mtpfs \
                    nmon \
                    p7zip \
                    patch \
                    pv \
                    screen \
                    smartmontools \
                    stress-ng \
                    unrar \
                    usb-modeswitch \
                    vim"

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" efibootmgr st"
fi

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/{bin,data,lib}

    # autossh
    cp -P $(get_install_dir autossh)/usr/bin/autossh ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # bottom
    cp -P $(get_install_dir bottom)/btm ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # diffutils
    cp -P $(get_install_dir diffutils)/usr/bin/{cmp,diff,diff3,sdiff} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # dstat
    cp -P $(get_install_dir dstat)/usr/bin/dstat ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # dtach
    cp -P $(get_install_dir dtach)/usr/bin/dtach ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # efibootmgr
    cp -P $(get_install_dir efibootmgr)/usr/bin/efibootmgr ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # encfs
    cp -P $(get_install_dir encfs)/usr/bin/{encfs,encfsctl} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # evtest
    cp -P $(get_install_dir evtest)/usr/bin/evtest ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # fdupes
    cp -P $(get_install_dir fdupes)/usr/bin/fdupes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # file
    cp -P $(get_install_dir file)/usr/bin/file ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir file)/usr/share/misc/magic.mgc ${ADDON_BUILD}/${PKG_ADDON_ID}/data

    # getscancodes
    cp -P $(get_install_dir getscancodes)/usr/bin/getscancodes ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # hddtemp
    cp -P $(get_install_dir hddtemp)/usr/sbin/hddtemp ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir hddtemp)/usr/share/misc/hddtemp.db ${ADDON_BUILD}/${PKG_ADDON_ID}/data

    # hd-idle
    cp -P $(get_install_dir hd-idle)/usr/sbin/hd-idle ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # hid_mapper
    cp -P $(get_install_dir hid_mapper)/usr/bin/hid_mapper ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # htop
    cp -P $(get_install_dir htop)/usr/bin/htop ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # i2c-tools
    cp -P $(get_install_dir i2c-tools)/usr/sbin/{i2cdetect,i2cdump,i2cget,i2cset} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir i2c-tools)/usr/lib/${PKG_PYTHON_VERSION}/site-packages/smbus.so ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so.0
    cp -P $(get_install_dir i2c-tools)/usr/lib/libi2c.so.0.1.0 ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/libi2c.so.0.1.0

    # inotify-tools
    cp -P $(get_install_dir inotify-tools)/usr/bin/{inotifywait,inotifywatch} ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # jq
    cp -P $(get_install_dir jq)/usr/bin/jq ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P $(get_install_dir oniguruma)/usr/lib/{libonig.so,libonig.so.5,libonig.so.5.2.0} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib

    # lm_sensors
    cp -P $(get_install_dir lm_sensors)/usr/bin/sensors ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # lshw
    cp -P $(get_install_dir lshw)/usr/sbin/lshw ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # mc
    cp -Pa $(get_install_dir mc)/usr/bin/* ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/
    cp -Pa $(get_install_dir mc)/storage/.kodi/addons/virtual.system-tools/* ${ADDON_BUILD}/${PKG_ADDON_ID}

    # mtpfs
    cp -P $(get_install_dir mtpfs)/usr/bin/mtpfs ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/

    # nmon
    cp -P $(get_install_dir nmon)/usr/bin/nmon ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/

    # p7zip
    mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip
    cp -P $(get_install_dir p7zip)/usr/bin/{7z,7za,7z.so} ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip
    cp -PR $(get_install_dir p7zip)/usr/bin/Codecs ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/p7zip

    # patch
    cp -P $(get_install_dir patch)/usr/bin/patch ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # pv
    cp -P $(get_install_dir pv)/usr/bin/pv ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # screen
    cp -L $(get_install_dir screen)/usr/bin/screen ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # smartmontools
    cp -P $(get_install_dir smartmontools)/usr/sbin/smartctl ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # st
    cp -P $(get_build_dir st)/st ${ADDON_BUILD}/${PKG_ADDON_ID}/bin 2>/dev/null || :

    # stress-ng
    cp -P $(get_install_dir stress-ng)/usr/bin/stress-ng ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # unrar
    cp -P $(get_install_dir unrar)/usr/bin/unrar ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # usb-modeswitch
    cp -P $(get_install_dir usb-modeswitch)/usr/sbin/usb_modeswitch ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

    # vim
    cp -P $(get_install_dir vim)/usr/bin/vim ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -Pa $(get_install_dir vim)/storage/.kodi/addons/virtual.system-tools/data/vim/ ${ADDON_BUILD}/${PKG_ADDON_ID}/data
}
