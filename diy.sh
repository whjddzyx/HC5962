#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

device_name='HC5962'
wifi_name='HiWiFi'
lan_ip='192.168.199.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
delete_bootstrap=true       # 是否删除默认主题 true 、false
default_theme='argon_mc2'   # 默认主题 结合主题文件夹名字 
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'  # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址 
lienol_url='https://github.com/Lienol/openwrt-package.git'       # Lienol 包地址
adguardhome_url='https://github.com/rufengsuixing/luci-app-adguardhome.git' # adguardhome 包地址

#插件源码
wifischedule_url='https://github.com/newkit/luci-app-wifischedule.git' # wifi计划插件地址
autoreboot_url='https://github.com/awesome-openwrt/luci-app-autoreboot.git' #高级重启插件地址
unblockmusic_url='https://github.com/maxlicheng/luci-app-unblockmusic.git' #网易云音乐解锁地址
 
 
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








echo '添加主题argon'

git clone $theme_argon package/lean/luci-theme-argon-mc

echo 'CONFIG_PACKAGE_luci-theme-argon-mc=y' >> .config










echo '修改默认主题'
sed -i "s/bootstrap_mod/$default_theme/g" package/default-settings/files/zzz-default-settings



#echo '添加本地域名访问路由器管理页面'
#sed -i "/127.0.0.1 localhost/a $lan_ip $device_name" package/base-files/files/etc/hosts




#if [ $delete_bootstrap ] ;then

#  echo "去除默认bootstrap主题"

 # sed -i '/\+luci-theme-bootstrap/d' feeds/luci/collections/luci/Makefile

#  sed -i '/\+luci-theme-bootstrap/d' package/feeds/luci/luci/Makefile

#  sed -i '/CONFIG_PACKAGE_luci-theme-bootstrap=y/d' .config

 # sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# fi











echo '添加OpenClash'
git clone $openClash_url package/lean/luci-app-openclash 
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config

#---------------adguardhome无法启动暂时去掉-------------------------
#echo '添加adguardhome'
#git clone $adguardhome_url package/lean/luci-app-adguardhome
#echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-adguardhome-zh-cn=y'  >> .config


echo '添加amule插件'
echo 'CONFIG_PACKAGE_luci-app-amule=y' >> .config




echo '添加wrtbwmon插件'
echo 'CONFIG_PACKAGE_luci-app-wrtbwmon=y' >> .config




echo '添加wifi计划插件'
git clone $wifischedule_url package/lean/luci-app-wifischedule
echo 'CONFIG_PACKAGE_luci-app-wifischedule=y' >> .config


echo '添加高级重启插件'
git clone $autoreboot_url package/lean/luci-app-autoreboot
echo 'CONFIG_PACKAGE_luci-app-autoreboot=y' >> .config

 

#echo '添加Passwall'

#echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y' >> .config

#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y' >> .config

#echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y'  >> .config





echo '添加网易云音乐解锁最新版本'
git clone $unblockmusic_url package/lean/luci-app-unblockmusic
echo 'CONFIG_PACKAGE_luci-app-unblockmusic=y' >> .config



















# Define My Package
#git clone https://github.com/fw876/helloworld.git package/lean/luci-app-ssr-plus