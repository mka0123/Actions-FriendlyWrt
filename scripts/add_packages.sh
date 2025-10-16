#!/bin/bash

# {{ Add luci-app-poweroff
(cd friendlywrt && {
    mkdir -p package/luci-app-poweroff
    git clone https://github.com/mka0123/luci-app-poweroff
})
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-poweroff=y
EOL
# }}
