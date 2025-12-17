#!/bin/bash
#===============================================
# Description: 2305_x64_test DIY script part 2
# File name: 2305_x64_test_diy-part2.sh
# Lisence: MIT
# By: GXNAS
#===============================================

echo "开始 DIY2 配置……"
echo "========================="
build_date=$(TZ=Asia/Shanghai date "+%Y.%m.%d")
build_name="测试版"

# Git稀疏克隆，只克隆指定目录到本地
chmod +x $GITHUB_WORKSPACE/diy_script/function.sh
source $GITHUB_WORKSPACE/diy_script/function.sh
rm -rf package/custom; mkdir package/custom

# 修改主机名字，修改你喜欢的就行（不能纯数字或者使用中文）
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-GXNAS'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='.*'/hostname='OpenWrt-GXNAS'/g" ./package/base-files/files/bin/config_generate

# 修改默认IP
sed -i 's/192.168.1.1/192.168.1.11/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.1.11/g' package/base-files/luci2/bin/config_generate

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./d' package/lean/default-settings/files/zzz-default-settings

# 调整 x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 设置ttyd免帐号登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# 默认 shell 为 bash
sed -i 's/\/bin\/ash/\/bin\/bash/g' package/base-files/files/etc/passwd

# samba解除root限制
sed -i 's/invalid users = root/#&/g' feeds/packages/net/samba4/files/smb.conf.template

# coremark跑分定时清除
sed -i '/\* \* \* \/etc\/coremark.sh/d' feeds/packages/utils/coremark/*

# 解决helloworld源缺少依赖问题
rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/sing-box
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/dns2socks
rm -rf feeds/packages/net/microsocks
cp -r feeds/passwall_packages/xray-core feeds/packages/net
cp -r feeds/passwall_packages/v2ray-geodata feeds/packages/net
cp -r feeds/passwall_packages/sing-box feeds/packages/net
cp -r feeds/passwall_packages/chinadns-ng feeds/packages/net
cp -r feeds/passwall_packages/dns2socks feeds/packages/net
cp -r feeds/passwall_packages/microsocks feeds/packages/net
mkdir -p package/helloworld
git clone https://github.com/immortalwrt/packages.git
cp -r packages/net/dns2socks package/helloworld/dns2socks
cp -r packages/net/microsocks package/helloworld/microsocks
cp -r packages/net/ipt2socks package/helloworld/ipt2socks
cp -r packages/net/pdnsd-alt package/helloworld/pdnsd-alt
cp -r packages/net/redsocks2 package/helloworld/redsocks2
rm -rf packages

# 修复Shadowsocks报错
rm -rf feeds/helloworld/shadowsocks-rust
wget -P feeds/helloworld/shadowsocks-rust https://raw.githubusercontent.com/gxnas/OpenWrt_Build_x64/refs/heads/main/personal/shadowsocks-rust/Makefile
rm -rf feeds/passwall_packages/shadowsocks-rust
wget -P feeds/passwall_packages/shadowsocks-rust https://raw.githubusercontent.com/gxnas/OpenWrt_Build_x64/refs/heads/main/personal/shadowsocks-rust/Makefile

#luci-app-turboacc
rm -rf feeds/luci/applications/luci-app-turboacc
git clone https://github.com/chenmozhijin/turboacc
mkdir -p package/luci-app-turboacc
mv turboacc/luci-app-turboacc package/luci-app-turboacc
rm -rf turboacc

# luci-app-adbyby-plus
rm -rf feeds/packages/net/adbyby-plus
rm -rf feeds/luci/applications/luci-app-adbyby-plus
git clone https://github.com/kiddin9/kwrt-packages
mkdir -p package/luci-app-adbyby-plus
mv kwrt-packages/luci-app-adbyby-plus package/luci-app-adbyby-plus
rm -rf kwrt-packages

# frpc frps
rm -rf feeds/luci/applications/{luci-app-frpc,luci-app-frps,luci-app-hd-idle,luci-app-adblock,luci-app-filebrowser}
merge_package master https://github.com/immortalwrt/luci package/custom applications/luci-app-openlist applications/luci-app-filebrowser applications/luci-app-syncdial applications/luci-app-eqos applications/luci-app-nps applications/luci-app-nfs applications/luci-app-frpc applications/luci-app-frps applications/luci-app-hd-idle applications/luci-app-adblock applications/luci-app-socat

# nikki
git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-nikki.git package/luci-app-nikki

# mosdns
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
git clone --depth=1 -b v5 https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# passwall
rm -rf feeds/luci/applications/luci-app-passwall
merge_package main https://github.com/xiaorouji/openwrt-passwall package/custom luci-app-passwall

# passwall2
# merge_package main https://github.com/xiaorouji/openwrt-passwall2 package/custom luci-app-passwall2

# openclash
rm -rf feeds/luci/applications/luci-app-openclash
merge_package master https://github.com/vernesong/OpenClash package/custom luci-app-openclash
# merge_package dev https://github.com/vernesong/OpenClash package/custom luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/custom/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# argon 主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth=1 -b js https://github.com/lwb1978/luci-theme-kucat package/luci-theme-kucat

# 修改 argon 为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/Bootstrap theme/Argon theme/g' feeds/luci/collections/*/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/*/Makefile

# 最大连接数修改为65535
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 替换curl修改版（无nghttp3、ngtcp2）
curl_ver=$(grep -i "PKG_VERSION:=" feeds/packages/net/curl/Makefile | awk -F'=' '{print $2}')
if [ "$curl_ver" != "8.9.1" ]; then
    echo "当前 curl 版本是: $curl_ver,开始替换......"
    rm -rf feeds/packages/net/curl
    cp -rf $GITHUB_WORKSPACE/personal/curl feeds/packages/net/curl
fi

# 更改argon主题背景
cp -f $GITHUB_WORKSPACE/personal/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 显示增加编译时间
sed -i "s/DISTRIB_REVISION='R[0-9]\+\.[0-9]\+\.[0-9]\+'/DISTRIB_REVISION='@R$build_date'/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/LEDE/OpenWrt_2305_x64_${build_name} by GXNAS build/g" package/lean/default-settings/files/zzz-default-settings

# 修改右下角脚本版本信息和登录页版本信息
cp -f $GITHUB_WORKSPACE/personal/argon/footer.ut package/luci-theme-argon/ucode/template/themes/argon/footer.ut
cp -f $GITHUB_WORKSPACE/personal/argon/footer_login.ut package/luci-theme-argon/ucode/template/themes/argon/footer_login.ut
sed -i "s/OpenWrt_2305_x64_build_name by GXNAS build @R build_date/OpenWrt_2305_x64_${build_name} by GXNAS build @R${build_date}/g" \
package/luci-theme-argon/ucode/template/themes/argon/footer.ut \
package/luci-theme-argon/ucode/template/themes/argon/footer_login.ut

# 修改欢迎banner
cp -f $GITHUB_WORKSPACE/personal/banner package/base-files/files/etc/banner

# 修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

./scripts/feeds update -a
./scripts/feeds install -a

echo "========================="
echo " DIY2 配置完成……"
