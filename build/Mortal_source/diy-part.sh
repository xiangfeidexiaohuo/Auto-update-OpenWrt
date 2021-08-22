
#!/bin/bash

# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>

# DIY扩展二合一了，在此处可以增加插件

# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件

# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好

# 修改IP项的EOF于EOF之间请不要插入其他扩展代码，可以删除或注释里面原本的代码

#Modify Router Name

sed -i 's/OpenWrt/Trb.Corp/g' package/base-files/files/bin/config_generate



#Modify Default Network Interface

sed -i '/ucidef_set_interface_lan/s/eth0/eth1 eth2 eth3 eth4 eth5/g' package/base-files/files/etc/board.d/99-default_network

sed -i '/ucidef_set_interface_wan/s/eth1/eth0/g' package/base-files/files/etc/board.d/99-default_network



# Theme

git clone https://github.com/jerrykuku/luci-theme-argon.git package/custom/luci-theme-argon-19.07



#Add Package

git clone https://github.com/tty228/luci-app-serverchan.git package/custom/serverchan

git clone https://github.com/wltc2005/openwrt-redsocks2.git package/custom/redsocks2

git clone https://github.com/jerrykuku/luci-app-argon-config.git package/custom/argon-config

git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/custom/autotimeset

git clone https://github.com/godros/luci-app-godproxy.git package/custom/luci-app-godproxy

git clone https://github.com/linkease/nas-packages.git package/custom/nas-packages

git clone https://github.com/destan19/OpenAppFilter.git package/custom/OpenAppFilter



#Add files

svn checkout https://github.com/trombonist852/custom/trunk/luci-app-filetransfer package/custom/luci-app-filetransfer

svn checkout https://github.com/trombonist852/custom/trunk/r8125-9.005.06 package/custom/r8125-9.005.06







sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile           # 选择argon为默认主题



sed -i "s/OpenWrt /${Author} Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ          # 增加个性名字${Author}默认为你的github账号

