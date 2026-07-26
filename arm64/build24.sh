#!/bin/bash

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始构建固件..."

# ============ iStoreOS 24.10 官方集成插件=============

# 定义初始化变量
PACKAGES=""

# iStoreOS精简集成列表
PACKAGES="$PACKAGES -dnsmasq"
PACKAGES="$PACKAGES dnsmasq-full"
PACKAGES="$PACKAGES -firewall"
PACKAGES="$PACKAGES firewall4"
PACKAGES="$PACKAGES istoreos-files"
PACKAGES="$PACKAGES luci"
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-quickstart-zh-cn"
PACKAGES="$PACKAGES luci-i18n-package-manager-zh-cn"
PACKAGES="$PACKAGES luci-theme-argon"
PACKAGES="$PACKAGES luci-app-argon-config"
PACKAGES="$PACKAGES luci-i18n-argon-zh-cn"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ramfree-zh-cn"
PACKAGES="$PACKAGES luci-i18n-filebrowser-go-zh-cn"

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
