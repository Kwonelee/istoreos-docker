#!/bin/sh
# 仅首次运行时执行，重启后消失

# 设置默认语言
uci set luci.main.lang='zh_cn'

# 统一提交更改
uci commit luci

exit 0
