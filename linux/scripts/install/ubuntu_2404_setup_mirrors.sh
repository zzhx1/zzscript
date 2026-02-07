echo '<<< Setup Mirrors >>>'
echo '请选择镜像源:'
echo '1 >> 阿里云'
echo '2 >> 中科大'
echo '3 >> 清华大学'

read -p '请输入选项 (1, 2, 3): ' choice

case $choice in
  1)
    echo '您选择了阿里云镜像源'
    sudo bash -c 'cat > etc/apt/sources.list.d/ubuntu.sources <<EOF
Types: deb
URIs: http://mirrors.aliyun.com/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF'
    ;;
  2)
    echo '您选择了中科大镜像源'
    sudo bash -c 'cat > etc/apt/sources.list.d/ubuntu.sources <<EOF
Types: deb
URIs: http://mirrors.ustc.edu.cn/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF'
    ;;
  3)
    echo '您选择了清华大学镜像源'
    sudo bash -c 'cat > etc/apt/sources.list.d/ubuntu.sources <<EOF
Types: deb
URIs: https://mirrors.tuna.tsinghua.edu.cn/ubuntu
Suites: noble noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF'
    ;;
  *)
    echo '无效的选项，请选择 1, 2, 或 3.'
    ;;
esac

echo '镜像源设置完成'



echo '更新所有软件包'
sudo apt -y update

