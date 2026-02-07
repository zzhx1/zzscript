#!/bin/bash
# Tmux 配置安装脚本
# 支持从 GitHub raw 直接执行
# 使用方法: sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_tmux.sh)"

set -e

echo '<<< Setup tmux >>>'

TMUXCONF_CONTENT="
#设置面板同步快捷键
bind S setw synchronize-panes

# 启用鼠标模式
setw -g mouse on

# 允许使用鼠标切换窗格
setw -g mouse-select-pane on

# 允许使用鼠标切换窗口
setw -g mouse-select-window on

# 允许使用鼠标调整窗格大小
setw -g mouse-resize-pane on

# 允许在复制模式下使用鼠标选择文本
setw -g mode-mouse on

# 启用鼠标滚轮滚动
setw -g mode-mouse on


"

# 备份现有配置
if [ -f ~/.tmux.conf ]; then
    echo "备份现有 ~/.tmux.conf 到 ~/.tmux.conf.bak"
    cp ~/.tmux.conf ~/.tmux.conf.bak
fi

# 将配置内容写入~/.tmux.conf文件
echo "$TMUXCONF_CONTENT" > ~/.tmux.conf

echo "✓ Tmux 配置已成功安装！"

# 如果 tmux 正在运行，重新加载配置
if command -v tmux >/dev/null 2>&1 && tmux list-sessions >/dev/null 2>&1; then
    echo "正在重新加载 Tmux 配置..."
    tmux source-file ~/.tmux.conf 2>/dev/null || true
    echo "✓ 配置已重新加载"
else
    echo "提示: 下次启动 tmux 时配置将自动生效"
fi

