#!/bin/bash

echo '<<< Setup tmux>>>'

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

# 将配置内容写入~/.tmux.conf文件

echo "$TMUXCONF_CONTENT" > ~/.tmux.conf

tmux source-file ~/.tmux.conf

