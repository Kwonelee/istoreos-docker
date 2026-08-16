#!/bin/bash

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始构建固件..."

# ============ 官方集成插件 =============

# 定义初始化变量
PACKAGES=""

# 精简集成列表
PACKAGES="dnsmasq-full firewall4 -dnsmasq -firewall"
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

# 深度优化：Docker环境下共享宿主机内核，不需要任何内核模块
PACKAGES="$PACKAGES \
-blkid -e2fsprogs \
-kmod-amazon-ena -kmod-atlantic -kmod-bcmgenet \
-kmod-dwmac-imx -kmod-dwmac-rockchip -kmod-dwmac-sun8i -kmod-e1000e \
-kmod-fs-vfat -kmod-fsl-dpaa1-net -kmod-fsl-dpaa2-net -kmod-fsl-enetc-net -kmod-fsl-fec \
-kmod-gpio-pca953x -kmod-i2c-mux-pca954x \
-kmod-mvneta -kmod-mvpp2 \
-kmod-octeontx2-net \
-kmod-phy-aquantia -kmod-phy-broadcom -kmod-phy-marvell -kmod-phy-marvell-10g \
-kmod-phy-realtek -kmod-phy-smsc -kmod-renesas-net-avb \
-kmod-rtc-rx8025 -kmod-sfp -kmod-vmxnet3 -kmod-wdt-sp805 \
-mkf2fs -partx-utils"
# 继续优化：移除指令是你的“愿望清单”，依赖关系是系统的“底线规则”
PACKAGES="$PACKAGES -block-mount -fdisk -lsblk -mdadm"
PACKAGES="$PACKAGES -mtd -urngd -fstools"
PACKAGES="$PACKAGES -kmod-* -kmod-nft-offload -ppp -ppp-mod-pppoe"

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
