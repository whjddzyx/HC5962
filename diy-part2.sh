#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

device_name='E8820S'
wifi_name='ZET'
lan_ip='192.168.8.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
#openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址 


 
#修改机器名称
echo "设置主机名"
sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate


# Modify default IP
echo "设置lan ip"
sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate


#修改默认时区
echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate


echo "修改wifi名称"

sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

#echo '添加OpenClash'
#git clone -master $openClash_url package/lean/luci-app-openclash 
#echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config

#echo '添加Passwall'

#echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y' >> .config

#echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y'  >> .config
 
