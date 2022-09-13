---
title: OpenWrt的编译笔记
date: 2022-01-09 22:39:01
start:
tags: ["OpenWrt","学习"]
categories: OpenWrt
---

##  前言：

   OpenWrt的固件编译基于[Lean](https://github.com/coolsnowwolf/lede)的Openwrt源码仓库进行编译。

   编译方式：<u>本地编译</u>，<u>[Github Actions](https://github.com/P3TERX/Actions-OpenWrt)</u> 云编译。



------



## 本地编译：
1. ### 准备工作：

2. 
   - 科学上网
   
   - Ubuntu TLS 20.04
   
   - 支持OpenWrt的设备例如网件R6220, 斐讯K2P，小米3C, 极路由1S，联想new3等。
   
   - 高性能X86软路由设备。

2. ### 编译配置：

   - 命令行输入: ```sudo apt-get update``` 然后输入 ```sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync```

   - 使用 `git clone https://github.com/coolsnowwolf/lede` 命令下载好源代码，然后 `cd lede` 进入目录

<!--more-->

   - 命令行输入:
   
      ```
        ./scripts/feeds update -a
        ./scripts/feeds install -a
        make menuconfig (配置.config)
      ```
      
   - `make -j8 download V=s` 下载dl库（国内请尽量全局科学上网）
   
   - 输入 `make -j1 V=s` （-j1 后面是线程数。第一次编译推荐用单线程）即可开始编译你要的固件了。
   
   - 温馨提示：
   
      ​		首次编译固件时，不要大量安装插件，否则编译会容易报错，大部分报错有可能是依赖没有下载全面说导致的，或者是插件冲突，在加入插件时应当考虑设备Rom容量和Ram，加入大量插件会使编译出的固件包太大而无法刷入设备，Ram不够插件运行的等。

1. ### Github Actions 云编译：

   - 使用[P3TERX](https://github.com/P3TERX)的云编译脚本，点击Fork

   - 脚本[文档](https://p3terx.com/archives/build-openwrt-with-github-actions.html)地址

   - 自定义 feeds 配置文件

        把 `feeds.conf.default` 文件放入仓库根目录即可，它会覆盖 Open­Wrt 源码目录下的相关文件。

   - 如果没有.config配置文件可以使用SSH 连接到 Actions

        通过 tmate 连接到 GitHub Ac­tions 虚拟服务器环境，可直接进行 `make menuconfig` 操作生成编译配置，或者任意的客制化操作。也就是说，你不需要再自己搭建编译环境了。这可能改变之前所有使用 GitHub Ac­tions 的编译 Open­Wrt 方式。

     - 在`Run Workflow`时把`SSH connection to Actions`的值改为`true`（或者也可以不修改，而是通过 [webhook 方式](https://p3terx.com/archives/github-actions-manual-trigger.html#toc_2)发送带有`ssh`触发关键词的请求。）

     - 在触发工作流程后，在 Actions 日志页面等待执行到`SSH connection to Actions`步骤，会出现类似下面的信息：

       ```
       To connect to this session copy-n-paste the following into a terminal or browser:
       
       ssh Y26QeagDtsPXp2mT6me5cnMRd@nyc1.tmate.io
       
       https://tmate.io/t/Y26QeagDtsPXp2mT6me5cnMRd
       ```

     - 复制 SSH 连接命令粘贴到终端内执行，或者复制链接在浏览器中打开使用网页终端。（网页终端可能会遇到黑屏的情况，按 `Ctrl`+`C` 即可）

     - `cd openwrt && make menuconfig`

     - 完成后按`Ctrl`+`D`组合键或执行`exit`命令退出，后续编译工作将自动进行。

     - **提示:**固件目录下有个`config.seed`或者`config.buildinfo`文件，如果你需要再次编译可以使用它。

2. ### 网件R6220配置：

   - 集成Hello world科学上网

   - Samba网络共享

   - miniDLAN

   - UPnP

   - 动态DDNS

   - 上网时间控制

   - FTP服务器

   - 硬盘休眠

   - Turbo ACC 网络加速

   - USB储存设备挂载

     - 支持 USB1，USB2，USB3

     - 支持exFAT，ext4，NTFS，VFAT(FAT32)

     - 支持自动挂载

     - 热插拔

```
CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_netgear_r6220=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_SAMBA_MAX_DEBUG_LEVEL=-1
CONFIG_PACKAGE_badblocks=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_boost=y
CONFIG_PACKAGE_boost-date_time=y
CONFIG_PACKAGE_boost-program_options=y
CONFIG_PACKAGE_boost-system=y
# CONFIG_PACKAGE_dns2socks is not set
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_hd-idle=y
CONFIG_PACKAGE_ip6tables=y
CONFIG_PACKAGE_ipt2socks=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_kcptun-client=y
CONFIG_PACKAGE_kcptun-config=y
CONFIG_PACKAGE_kmod-crypto-crc32c=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-ntfs=y
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-ipt-nat6=y
CONFIG_PACKAGE_kmod-iptunnel=y
CONFIG_PACKAGE_kmod-iptunnel4=y
CONFIG_PACKAGE_kmod-lib-crc16=y
CONFIG_PACKAGE_kmod-nf-nat6=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_kmod-nls-utf8=y
CONFIG_PACKAGE_kmod-scsi-core=y
CONFIG_PACKAGE_kmod-sit=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_libblkid=y
CONFIG_PACKAGE_libbz2=y
CONFIG_PACKAGE_libcomerr=y
CONFIG_PACKAGE_libevdev=y
CONFIG_PACKAGE_libexif=y
CONFIG_PACKAGE_libext2fs=y
CONFIG_PACKAGE_libfdisk=y
CONFIG_PACKAGE_libffmpeg-audio-dec=y
CONFIG_PACKAGE_libflac=y
CONFIG_PACKAGE_libid3tag=y
CONFIG_PACKAGE_libjpeg-turbo=y
CONFIG_PACKAGE_libmaxminddb=y
CONFIG_PACKAGE_libmbedtls=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libogg=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_libsmartcols=y
CONFIG_PACKAGE_libsqlite3=y
CONFIG_PACKAGE_libss=y
CONFIG_PACKAGE_libstdcpp=y
CONFIG_PACKAGE_libudev-zero=y
CONFIG_PACKAGE_libusb-1.0=y
CONFIG_PACKAGE_libuv=y
CONFIG_PACKAGE_libvorbis=y
CONFIG_PACKAGE_lua-cjson=y
CONFIG_PACKAGE_lua-maxminddb=y
CONFIG_PACKAGE_luasocket=y
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-samba=y
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-i18n-hd-idle-zh-cn=y
CONFIG_PACKAGE_luci-i18n-minidlna-zh-cn=y
CONFIG_PACKAGE_luci-i18n-samba-zh-cn=y
CONFIG_PACKAGE_luci-i18n-vssr-zh-cn=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_luci-theme-mcat=y
# CONFIG_PACKAGE_microsocks is not set
CONFIG_PACKAGE_minidlna=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcp6c_ext_cer_id=0
CONFIG_PACKAGE_odhcpd-ipv6only=y
CONFIG_PACKAGE_odhcpd_ipv6only_ext_cer_id=0
# CONFIG_PACKAGE_resolveip is not set
CONFIG_PACKAGE_samba36-server=y
CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
CONFIG_PACKAGE_shadowsocks-libev-ss-redir=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-server=y
CONFIG_PACKAGE_simple-obfs=y
# CONFIG_PACKAGE_tcping is not set
CONFIG_PACKAGE_terminfo=y
CONFIG_PACKAGE_trojan=y
CONFIG_PACKAGE_usbids=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_xray-plugin=y
CONFIG_SQLITE3_DYNAMIC_EXTENSIONS=y
CONFIG_SQLITE3_FTS3=y
CONFIG_SQLITE3_FTS4=y
CONFIG_SQLITE3_FTS5=y
CONFIG_SQLITE3_JSON1=y
CONFIG_SQLITE3_RTREE=y
CONFIG_boost-compile-visibility-hidden=y
CONFIG_boost-runtime-shared=y
CONFIG_boost-static-and-shared-libs=y
CONFIG_boost-variant-release=y
```



​     

