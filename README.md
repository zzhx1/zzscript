# zzscript

个人脚本集合仓库，包含 Linux 系统配置脚本和常用工具脚本。

## 项目结构

```
zzscript/
├── check_tcp/          # TCP 客户端/服务器测试工具
│   ├── client.py       # TCP 客户端
│   └── server.py       # TCP 服务器
├── linux/              # Linux 系统配置脚本
│   ├── config/         # 配置文件
│   │   ├── vimrc.txt   # Vim 配置文件
│   │   └── plug.vim    # Vim 插件管理器
│   └── scripts/
│       ├── install/    # 安装脚本
│       │   ├── install_app.sh              # 安装常用软件
│       │   ├── ubuntu_2202_setup_mirrors.sh # Ubuntu 22.02 镜像源配置
│       │   └── ubuntu_2404_setup_mirrors.sh # Ubuntu 24.04 镜像源配置
│       └── setup/      # 设置脚本
│           ├── init.sh      # 初始化脚本
│           ├── set_vim.sh   # Vim 配置脚本
│           ├── set_zshrc.sh # Zsh 配置脚本
│           ├── set_tmux.sh  # Tmux 配置脚本
│           ├── set_ohmyzsh.sh # Oh My Zsh 配置脚本
│           └── fish.sh      # Fish shell 配置脚本
└── README.md
```

## 功能说明

### check_tcp/
TCP 网络测试工具，用于测试 TCP 连接。

- `server.py`: 启动 TCP 服务器，监听端口 6009
- `client.py`: TCP 客户端，连接到服务器并发送消息

**使用方法：**
```bash
# 终端1：启动服务器
python3 check_tcp/server.py

# 终端2：启动客户端
python3 check_tcp/client.py
```

### linux/
Linux 系统配置和安装脚本集合。

#### config/
存放配置文件：
- `vimrc.txt`: Vim 编辑器配置文件
- `plug.vim`: Vim 插件管理器

#### scripts/install/
安装脚本：
- `install_app.sh`: 一键安装常用开发工具（vim, git, tmux, gdb 等）
- `ubuntu_*_setup_mirrors.sh`: 配置 Ubuntu 软件源镜像

#### scripts/setup/
设置脚本：
- `init.sh`: 系统初始化脚本
- `set_vim.sh`: 配置 Vim 编辑器
- `set_zshrc.sh`: 配置 Zsh shell
- `set_tmux.sh`: 配置 Tmux 终端复用器
- `set_ohmyzsh.sh`: 配置 Oh My Zsh
- `fish.sh`: 配置 Fish shell

## 使用说明

### 快速安装（推荐）

支持直接从 GitHub 执行安装脚本，无需克隆仓库：

#### 配置 Vim
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_vim.sh)"
```

或者使用 wget：
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_vim.sh)"
```

#### 配置 Tmux
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_tmux.sh)"
```

或者使用 wget：
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_tmux.sh)"
```

#### 安装 Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_ohmyzsh.sh)"
```

或者使用 wget：
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/zzhx1/zzscript/main/linux/scripts/setup/set_ohmyzsh.sh)"
```

### 本地安装

如果已经克隆了仓库，也可以本地执行：

1. **安装常用软件：**
   ```bash
   cd linux/scripts/install
   bash install_app.sh
   ```

2. **配置 Vim：**
   ```bash
   cd linux/scripts/setup
   bash set_vim.sh
   ```

3. **配置 Tmux：**
   ```bash
   cd linux/scripts/setup
   bash set_tmux.sh
   ```

4. **安装 Oh My Zsh：**
   ```bash
   cd linux/scripts/setup
   bash set_ohmyzsh.sh
   ```

5. **配置其他工具：**
   ```bash
   cd linux/scripts/setup
   bash set_zshrc.sh  # 或其他配置脚本
   ```

## 注意事项

- 运行脚本前请确保有相应的执行权限：`chmod +x script_name.sh`
- 部分脚本需要 root 权限，请使用 `sudo` 运行
- 建议在运行脚本前先备份相关配置文件

## 许可证

MIT License
