<div align="center">
<img width="768" src="https://github.com/gxnas/OpenWrt_Build_x64/blob/main/personal/logo.png"/>
<h1>OpenWrt_Build_x64</h1>
</div>

## 当前编译状态：
|    序号    |     架构名称    |    编译状态    |    固件下载    |
| :-----------------: | :-------------: |:-----------------: | :-----------------: |
| 1 |OpenWrt_2305_x64_全功能版|<a href="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_all.yml"><img src="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_all.yml/badge.svg?style=flat" /></a>    |[下载地址](https://github.com/bobvane/OpenWrt_Build_x64/releases/tag/OpenWrt_2305_x64_all)|
| 2 |OpenWrt_2305_x64_主路由版|<a href="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_wjq.yml"><img src="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_wjq.yml/badge.svg?style=flat" /></a>    |[下载地址](https://github.com/bobvane/OpenWrt_Build_x64/releases/tag/OpenWrt_2305_x64_wjq)|
| 3 |OpenWrt_2305_x64_旁路由版|<a href="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_gxnas.yml"><img src="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_gxnas.yml/badge.svg?style=flat" /></a>|[下载地址](https://github.com/bobvane/OpenWrt_Build_x64/releases/tag/OpenWrt_2305_x64_gxnas)|
| 4 |OpenWrt_2305_x64_精简版|<a href="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_soot.yml"><img src="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_soot.yml/badge.svg?style=flat" /></a>    |[下载地址](https://github.com/bobvane/OpenWrt_Build_x64/releases/tag/OpenWrt_2305_x64_soot)|
| 5 |OpenWrt_2305_x64_测试版|<a href="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_test.yml"><img src="https://github.com/bobvane/OpenWrt_Build_x64/actions/workflows/OpenWrt_Build_2305_x64_test.yml/badge.svg?style=flat" /></a>    |[下载地址](https://github.com/bobvane/OpenWrt_Build_x64/releases/tag/OpenWrt_2305_x64_test)|

</br>

## 项目说明 [![](https://github.com/gxnas/OpenWrt_Build_x64/blob/main/personal/describes.svg)](#项目说明-)
- 固件编译使用的源代码来自：[![Lean](https://img.shields.io/badge/Lede-Lean-red.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)，[![gxnas](https://img.shields.io/badge/Lede-Lean-red.svg?style=flat&logo=appveyor)](https://github.com/gxnas/OpenWrt_Build_x64)
- 项目使用 Github Actions 拉取 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt-23.05（内核版本6.6）` 源码仓库进行云编译
- 🔴[OpenWrt_2305_x64_全功能版] 固件默认的IP地址：`192.168.18.1` 默认密码：`无密码`
- 🔴[OpenWrt_2305_x64_主路由版] 固件默认 IP 地址：`192.168.18.1` 默认密码：`无密码`
- 🔴[OpenWrt_2305_x64_旁路由版] 固件默认 IP 地址：`192.168.1.11` 默认密码：`无密码`
- 🔴[OpenWrt_2305_x64_精简版] 固件默认 IP 地址：`192.168.1.11` 默认密码：`无密码`
- 🔴[OpenWrt_2305_x64_测试版] 固件默认 IP 地址：`192.168.1.11` 默认密码：`无密码`
-  本库编译的x86固件为squashfs格式；
-  ext4 与squashfs 格式的区别： ext4 格式的rootfs 可以扩展磁盘空间大小，而squashfs 不能。 squashfs 格式的rootfs 可以使用重置功能（恢复出厂设置），而ext4 不能；
-  默认的固件容量：Kernel=32M、rootfs=968M，请确保安装OpenWrt的硬盘空间至少要有1G以上；
-  OpenWrt升级方法：下载好对应版本的.img.gz文件到电脑上，不需要解压，然后在你的OpenWrt菜单“系统-备份/升级”直接选择下载好的.img.gz文件上传，刷写固件；
- 🛑******最好不要跨大版本升级（比如1806升级到2305，或者6.1内核升级6.6），大版本更新建议采用全新安装方可获得最佳的体验。******

----
- REPO_TOKEN密匙制作教程：https://git.io/jm.md
- 云编译需要 [在此](https://github.com/settings/tokens) 创建个```token```,勾选：```repo```， ```workflow```，保存所得的key
- 然后在此仓库```设置```->```Secrets```中添加个名字为```GH_TOKEN```的Secret,填入token获得的key

- Telegram通知```设置```->```Secrets```中添加名字为```TELEGRAM_TO```和```TELEGRAM_TOKEN```，值分别为BOT_USER _ID和BOT_TOKEN
- 企业微信机器人通知```设置```->```Secrets```中添加个名字为```WEBHOOK_SEND_KEY```，值为企业微信机器人https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=后面的值
----


## 插件预览 [![](https://github.com/gxnas/OpenWrt_Build_x64/blob/main/personal/preview.svg)](#插件预览-)
<details>
<summary><b>&nbsp; OpenWrt_2305_x64 插件预览</b></summary>
<br/>

| 功能列表 | - 全功能版 - | - 主路由版 - | - 旁路由版 - | - 精简版 - |
| :----- | :----: | :----: | :----: | :----: |
| **【状态】** | ✓ | ✓ | ✓ | ✓ |
| 概览 | ✓ | ✓ | ✓ | ✓ |
| 路由 | ✓ | ✓ | ✓ | ✓ |
| 防火墙 | ✓ | ✓ | ✓ | ✓ |
| 系统日志 | ✓ | ✓ | ✓ | ✓ |
| 系统进程 | ✓ | ✓ | ✓ | ✓ |
| 实时信息 | ✓ | ✓ | ✓ | ✓ |
| WireGuard | ✓ | ✓ | ✓ | ✓ |
| SoftEtherVPN Status | ✓ | ✓ |   |   |
| MultiWAN管理器 | ✓ | ✓ |   |   |
| 联机用户 | ✓ | ✓ |   |   |
| 释放内存 | ✓ | ✓ | ✓ | ✓ |
| **【系统】** | ✓ | ✓ | ✓ | ✓ |
| 系统 | ✓ | ✓ | ✓ | ✓ |
| 管理权 | ✓ | ✓ | ✓ | ✓ |
| 实时监控 | ✓ | ✓ | ✓ |   |
| 软件包 | ✓ | ✓ | ✓ | ✓ |
| 启动项 | ✓ | ✓ | ✓ | ✓ |
| 计划任务 | ✓ | ✓ | ✓ | ✓ |
| 挂载点 | ✓ | ✓ | ✓ | ✓ |
| 分区扩容 | ✓ | ✓ | ✓ | ✓ |
| 磁盘管理 | ✓ | ✓ | ✓ | ✓ |
| 备份/升级 | ✓ | ✓ | ✓ | ✓ |
| 文件浏览器 | ✓ | ✓ | ✓ | ✓ |
| 重启 | ✓ | ✓ | ✓ | ✓ |
| 关机 | ✓ | ✓ | ✓ | ✓ |
| **【服务】** | ✓ | ✓ | ✓ | ✓ |
| PassWall | ✓ | ✓ | ✓ | ✓ |
| 广告屏蔽大师Plus+ | ✓ | ✓ | ✓ |   |
| Alist | ✓ | ✓ | ✓ |   |
| HomeProxy | ✓ | ✓ |   |   |
| ShadowSocksR Plus+ | ✓ | ✓ | ✓ | ✓ |
| AdGuardHome | ✓ | ✓ | ✓ |   |
| 应用过滤 | ✓ | ✓ |   |   |
| MosDNS | ✓ | ✓ | ✓ |   |
| 微信推送 | ✓ | ✓ |   |  |
| OpenClash | ✓ | ✓ | ✓ | ✓ |
| 解除网易云音乐播放限制 | ✓ | ✓ | ✓ |   |
| Lucky大吉 | ✓ | ✓ |   |   |
| Tailscale | ✓ | ✓ | ✓ | ✓ |
| 网络唤醒 | ✓ | ✓ |   |   |
| KMS服务器 | ✓ | ✓ | ✓ | ✓ |
| DDNS-GO | ✓ | ✓ |   |   |
| frp客户端 | ✓ |   |   |   |
| frp服务器 | ✓ |   |   |   |
| MihomoTProxy | ✓ | ✓ |   |   |
| PassWall2 | ✓ |   |   |   |
| 网络共享 | ✓ | ✓ | ✓ | ✓ |
| 终端 | ✓ | ✓ | ✓ |   |
| udpxy | ✓ | ✓ |   |   |
| uHTTPd | ✓ | ✓ | ✓ |   |
| UPnP | ✓ | ✓ | ✓ |   |
| **【iStore】** | ✓ | ✓ | ✓ | ✓ |
| **【Docker】** | ✓ |   |   |   |
| 配置 | ✓ |   |   |   |
| 概览 | ✓ |   |   |   |
| 容器 | ✓ |   |   |   |
| 镜像 | ✓ |   |   |   |
| 网络 | ✓ |   |   |   |
| 卷标 | ✓ |   |   |   |
| 事件 | ✓ |   |   |   |
| **【管控】** | ✓ | ✓ |   |   |
| 访问限制 | ✓ | ✓ |   |   |
| 网址过滤 | ✓ | ✓ |   |   |
| 定时唤醒 | ✓ | ✓ |   |   |
| **【网络存储】** | ✓ |   |   |   |
| USB打印服务器 | ✓ |   |   |   |
| **【VPN】** | ✓ | ✓ | ✓ |   |
| ZeroTier | ✓ | ✓ |   |   |
| **【网络】** | ✓ | ✓ | ✓ | ✓ |
| 接口 | ✓ | ✓ | ✓ | ✓ |
| 路由 | ✓ | ✓ | ✓ | ✓ |
| DHCP/DNS | ✓ | ✓ | ✓ | ✓ |
| IP/MAC绑定 | ✓ | ✓ |   |   |
| 网络诊断 | ✓ | ✓ | ✓ | ✓ |
| 防火墙 | ✓ | ✓ | ✓ | ✓ |
| 流量监控 | ✓ | ✓ |   |   |
| Socat | ✓ | ✓ |   |   |
| Turbo ACC 网络加速 | ✓ | ✓ | ✓ | ✓ |
| 多线多拨 | ✓ | ✓ |   |   |
| MultiWAN管理器 | ✓ | ✓ |   |   |
| **【退出】** | ✓ | ✓ | ✓ | ✓ |



#### 使用说明：

#### 1、文件名带有efi字样的固件支持Uefi和Legacy两种引导方式启动，文件名不含efi的固件仅支持Legacy传统引导方式启动，请根据实际需要下载；

#### 2、全功能版、主路由版默认的IP地址：192.168.18.1；

#### 3、旁路由版、精简版默认的IP地址：192.168.1.11；

#### 4、所有版本默认用户名：root，无密码，登录后请立即设置密码；

#### 5、如果需要更改Openwrt默认的IP，可以用root登录SSH下输入命令 vi /etc/config/network 修改文件，需要注意的是，在SSH界面下看到有root@OpenWrt-GXNAS:/#开头的字样方可操作；

#### 6、安装硬盘不可低于1G；

#### 7、虚拟机安装的，请确保文件名和路径没有中文或者特殊符号，否则转换文件时有可能转换不成功。

<a href="#readme">
<img src="https://github.com/gxnas/OpenWrt_Build_x64/blob/main/personal/return.svg" title="返回顶部" align="right"/>
</a>
