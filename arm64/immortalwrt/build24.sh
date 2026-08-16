#!/bin/bash

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始构建固件..."

# ============ 官方集成插件 =============

# 定义初始化变量
PACKAGES=""

# 精简集成列表
PACKAGES="dnsmasq-full firewall4 -dnsmasq -firewall"
PACKAGES="$PACKAGES luci"
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-package-manager-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"

# 深度优化：Docker环境下共享宿主机内核，不需要任何内核模块

# 继续优化：移除指令是你的“愿望清单”，依赖关系是系统的“底线规则”


# 构建镜像
echo "开始构建......打印所有包名===="
echo "$PACKAGES"

# 开始构建
make image PROFILE=generic PACKAGES="$PACKAGES" FILES="files"

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - 构建成功."
