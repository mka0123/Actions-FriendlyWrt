#!/bin/bash

# {{ Add luci-app-diskman
(cd friendlywrt && {
    mkdir -p package/luci-app-diskman
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
    mkdir -p package/parted
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
})
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_smartmontools=y
EOL
# }}

# {{ Add luci-app-poweroff
(cd friendlywrt/package && {
    git clone https://github.com/mka0123/luci-app-poweroff.git --depth 1
})
echo "CONFIG_PACKAGE_luci-app-poweroff=y" >> configs/rockchip/01-nanopi
# echo "CONFIG_PACKAGE_luci-i18n-poweroff-zh-cn=y" >> configs/rockchip/01-nanopi
# }}
