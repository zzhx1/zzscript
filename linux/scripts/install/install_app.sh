#!/bin/bash

# 定义要安装的软件列表
packages="vim net-tools build-essential tmux gdb git fish openssh-server wget"

echo " 
        <<< 即将安装以下软件 >>>
vim：强大的文本编辑器，适合编写和编辑代码。
net-tools：提供如ifconfig、netstat等基本网络管理工具。
build-essential：包含编译器和相关工具的基本开发包。
tmux：终端复用器，可以在一个终端中管理多个会话。
gdb：GNU调试器，用于调试程序。
git：分布式版本控制系统，用于代码管理和协作。
fish：用户友好的命令行shell，支持强大的自动补全。
openssh-server：OpenSSH服务器，实现安全的远程登录。
mlocate：快速查找文件和目录的工具。
wget：命令行下载工具，用于从网络获取文件。
"


read -p "你确定要安装这些软件吗？请输入 'y' 确认安装: " confirm

# 检查用户输入
if [ "$confirm" != "y" ]; then
    echo "安装已取消"
    exit 1
fi



echo "更新源中..."
sudo apt-get -qq update
echo "更新源完成"
echo

# 循环安装软件
for package in $packages
do
    echo "正在安装 $package ..."
    sudo apt-get install -y $package
    if [ $? -eq 0 ]; then
        echo "$package 安装成功！"
    else
        echo "$package 安装失败！"
    fi
    echo
    
done
#设置git
git config --global credential.helper store
echo "git自动保存token"
echo



echo "所有软件已安装完成！"
echo
