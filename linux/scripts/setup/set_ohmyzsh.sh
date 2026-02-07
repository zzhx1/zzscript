#!/bin/sh
# Oh My Zsh 安装脚本
# 支持从 GitHub raw 直接执行
# 使用方法: sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_ohmyzsh.sh)"
# 兼容 sh/bash/zsh

set -e

OHMYZSH_URL="https://raw.githubusercontent.com/zzhx1/ohmyzsh/master/tools/install.sh"

echo "正在安装 Oh My Zsh..."

# 尝试使用 curl 安装
if command -v curl >/dev/null 2>&1; then
    echo "使用 curl 下载安装脚本..."
    sh -c "$(curl -fsSL $OHMYZSH_URL)" && exit 0
fi

# 尝试使用 wget 安装
if command -v wget >/dev/null 2>&1; then
    echo "使用 wget 下载安装脚本..."
    sh -c "$(wget -O- $OHMYZSH_URL)" && exit 0
fi

# 尝试使用 fetch 安装（FreeBSD）
if command -v fetch >/dev/null 2>&1; then
    echo "使用 fetch 下载安装脚本..."
    sh -c "$(fetch -o - $OHMYZSH_URL)" && exit 0
fi

# 所有方法都失败
echo "错误: 需要 curl、wget 或 fetch 来下载安装脚本"
exit 1
