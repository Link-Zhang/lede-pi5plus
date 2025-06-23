#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/10.0.0.3/g' package/base-files/luci2/bin/config_generate

# Modify hostname
sed -i 's/LEDE/Pi5Plus/g' package/base-files/luci2/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

# Modify Luci Login Page
sed -i '23,25d' feeds/luci/themes/luci-theme-argon/luasrc/view/themes/argon/footer_login.htm

# Modify Luci Page
sed -i '23,26d' feeds/luci/themes/luci-theme-argon/luasrc/view/themes/argon/footer.htm

# Change ash to bash
sed -i 's|/bin/ash$|/bin/bash|g' package/base-files/files/etc/passwd

# Change kernel to 5.10
sed -i 's|6.12|5.10|g' target/linux/rockchip/Makefile
sed -i 's|6.6|5.10|g' target/linux/rockchip/Makefile

# Change ttyd from services to system
sed -i 's|/services/|/system/|g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# Change samba4 from services to nas
sed -i 's|/services/|/nas/|g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

# Change theme depends to remove luci-theme-bootstrap
sed -i 's|+luci-theme-bootstrap|+luci-theme-argon|g' feeds/luci/collections/luci-light/Makefile
