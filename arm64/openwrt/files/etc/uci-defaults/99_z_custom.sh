#!/bin/sh
# 仅首次运行时执行，重启后消失

# 设置默认语言
uci set luci.main.lang='zh_cn'

# 设置时区为Asia/Shanghai
uci set system.@system[-1].zonename='Asia/Shanghai'

# 更换软件源
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' /etc/apk/repositories.d/distfeeds.list

# 更换NTP
uci delete system.ntp.server 2>/dev/null
uci add_list system.ntp.server='0.cn.pool.ntp.org'
uci add_list system.ntp.server='1.cn.pool.ntp.org'
uci add_list system.ntp.server='2.cn.pool.ntp.org'
uci add_list system.ntp.server='3.cn.pool.ntp.org'

# 设置LAN为DHCP
uci set network.lan.proto='dhcp'
uci delete network.lan.ipaddr 2>/dev/null
uci delete network.lan.netmask 2>/dev/null
uci delete network.lan.gateway 2>/dev/null
uci delete network.lan.dns 2>/dev/null

# 统一提交更改
uci commit system
uci commit network
uci commit luci

# 重启网络
/etc/init.d/network restart

exit 0
