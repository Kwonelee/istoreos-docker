#!/bin/sh
# 仅首次运行时执行，重启后消失

# ==================== 第一部分：基础配置 ====================

# 设置默认语言
uci set luci.main.lang='zh_cn'

# 设置版本信息
FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="iStoreOS 版本号 @kwonelee"
sed -i "s/^DISTRIB_REVISION=.*/DISTRIB_REVISION=''/" "$FILE_PATH"
sed -i "s#^DISTRIB_DESCRIPTION=.*#DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'#" "$FILE_PATH"

# ==================== 第二部分：网络配置 ====================

# 关闭 IPv6 AAAA 记录过滤
uci set dhcp.@dnsmasq[0].filter_aaaa='0'

# 删除 DockerNAT 规则
uci delete firewall.docker_nat 2>/dev/null

# ==================== 第三部分：统一提交所有更改 ====================

uci commit system
uci commit luci
uci commit dhcp
uci commit firewall

# ==================== 第四部分：重启服务 ====================

# 先重启 DNS 服务
/etc/init.d/dnsmasq restart

# 再重启防火墙
/etc/init.d/firewall restart

exit 0
