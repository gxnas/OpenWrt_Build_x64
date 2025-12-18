#!/bin/bash
#===============================================
# Description: OpenWrt_Build_2305_x64 DIY script part 1
# File name: 2305_x64_test_diy-part1.sh
# Lisence: MIT
# By: GXNAS
#===============================================

# Add a feed source
sed -i "/helloworld/d" feeds.conf.default
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

mkdir wget

cat>rename.sh<<-\EOF
#!/bin/bash
rm -rf  bin/targets/x86/64/config.buildinfo
rm -rf  bin/targets/x86/64/feeds.buildinfo
rm -rf  bin/targets/x86/64/openwrt-x86-64-generic-kernel.bin
rm -rf  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.vmdk
rm -rf  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.vmdk
rm -rf  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-rootfs.img.gz
rm -rf  bin/targets/x86/64/openwrt-x86-64-generic.manifest
rm -rf  bin/targets/x86/64/sha256sums
rm -rf  bin/targets/x86/64/version.buildinfo
rm -rf  bin/targets/x86/64/profiles.json
sleep 2
str1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
ver54=`grep "LINUX_VERSION-5.4 ="  include/kernel-5.4 | cut -d . -f 3`
ver510=`grep "LINUX_VERSION-5.10 ="  include/kernel-5.10 | cut -d . -f 3`
ver515=`grep "LINUX_VERSION-5.15 ="  include/kernel-5.15 | cut -d . -f 3`
ver61=`grep "LINUX_VERSION-6.1 ="  include/kernel-6.1 | cut -d . -f 3`
ver66=`grep "LINUX_VERSION-6.6 ="  include/kernel-6.6 | cut -d . -f 3`
if [ "$str1" = "5.4" ];then
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver54}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver54}_uefi.img.gz
elif [ "$str1" = "5.10" ];then
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver510}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver510}_uefi.img.gz
elif [ "$str1" = "5.15" ];then
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver515}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver515}_uefi.img.gz
elif [ "$str1" = "6.1" ];then
   if [ ! $ver61 ]; then
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver61}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver61}_uefi.img.gz
  else
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver61}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver61}_uefi.img.gz
   fi
elif [ "$str1" = "6.6" ];then
   if [ ! $ver66 ]; then
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver66}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver66}_uefi.img.gz
  else
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz       bin/targets/x86/64/openwrt_x86-64_${str1}.${ver66}_bios.img.gz
   mv  bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz   bin/targets/x86/64/openwrt_x86-64_${str1}.${ver66}_uefi.img.gz
   fi
fi
exit 0
EOF

# 修复 fstools 安装 jffs2reset 报错的问题
sed -i 's/{mount_root,jffs2reset}/mount_root/' package/system/fstools/Makefile
