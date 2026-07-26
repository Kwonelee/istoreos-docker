#!/bin/sh
# 仅首次运行时执行，重启后消失

# 设置默认语言
uci set luci.main.lang='zh_cn'
# 保存设置
uci commit system
uci commit luci

# 设置版本信息
FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="iStoreOS 版本号 @kwonelee"
sed -i "s/^DISTRIB_REVISION=.*/DISTRIB_REVISION=''/" "$FILE_PATH"
sed -i "s#^DISTRIB_DESCRIPTION=.*#DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'#" "$FILE_PATH"

exit 0
