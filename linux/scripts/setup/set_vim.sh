#!/bin/bash
# Vim 配置安装脚本
# 支持从 GitHub raw 直接执行
# 使用方法: sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_vim.sh)"

set -e

REPO_URL="https://raw.githubusercontent.com/zzhx1/zzscript/main"
TEMP_DIR=$(mktemp -d)

# 清理函数
cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "正在下载 Vim 配置文件..."

# 下载 vimrc.txt
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$REPO_URL/linux/config/vimrc.txt" -o "$TEMP_DIR/vimrc.txt" || {
        echo "错误: 无法下载 vimrc.txt"
        exit 1
    }
    curl -fsSL "$REPO_URL/linux/config/plug.vim" -o "$TEMP_DIR/plug.vim" || {
        echo "错误: 无法下载 plug.vim"
        exit 1
    }
elif command -v wget >/dev/null 2>&1; then
    wget -q "$REPO_URL/linux/config/vimrc.txt" -O "$TEMP_DIR/vimrc.txt" || {
        echo "错误: 无法下载 vimrc.txt"
        exit 1
    }
    wget -q "$REPO_URL/linux/config/plug.vim" -O "$TEMP_DIR/plug.vim" || {
        echo "错误: 无法下载 plug.vim"
        exit 1
    }
else
    echo "错误: 需要 curl 或 wget 来下载文件"
    exit 1
fi

echo "正在配置 Vim..."

# 备份现有配置
if [ -f ~/.vimrc ]; then
    echo "备份现有 ~/.vimrc 到 ~/.vimrc.bak"
    cp ~/.vimrc ~/.vimrc.bak
fi

# 安装配置文件
cp "$TEMP_DIR/vimrc.txt" ~/.vimrc
mkdir -p ~/.vim/autoload
cp "$TEMP_DIR/plug.vim" ~/.vim/autoload/

echo "正在安装 Vim 插件..."
vim +PlugInstall +qall 2>/dev/null || {
    echo "警告: Vim 插件安装可能需要手动执行: vim +PlugInstall +qall"
}

echo "✓ Vim 配置已成功安装！"
echo "配置文件位置: ~/.vimrc"
echo "插件管理器: ~/.vim/autoload/plug.vim"

