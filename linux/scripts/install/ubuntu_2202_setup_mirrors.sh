echo '<<< Setup Mirrors >>>'

while true; do
  echo '请选择镜像源:'
  echo '1) 阿里云'
  echo '2) 中科大'
  echo '3) 清华大学'

  read -p '请输入选项 (1, 2, 3): ' choice

  case $choice in
  1)
    echo '您选择了阿里云镜像源'
    sudo bash -c 'cat > /etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/ubuntu/   jammy main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/   jammy main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/   jammy-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/   jammy-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/   jammy-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/   jammy-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/   jammy-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/   jammy-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/   jammy-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/   jammy-backports main restricted universe multiverse
EOF'
    break
    ;;
  2)
    echo '您选择了中科大镜像源'
    sudo bash -c 'cat > /etc/apt/sources.list <<EOF
deb https://mirrors.ustc.edu.cn/ubuntu/   jammy main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/   jammy main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/   jammy-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/   jammy-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/   jammy-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/   jammy-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/   jammy-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/   jammy-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/   jammy-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/   jammy-proposed main restricted universe multiverse
EOF'
    break
    ;;
  3)
    echo '您选择了清华大学镜像源'
    sudo bash -c 'cat > /etc/apt/sources.list <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/   jammy-security main restricted universe multiverse
EOF'
    break
    ;;
  *)
    echo '无效的选项，请选择 1, 2, 或 3.'
    ;;
  esac
done

echo '镜像源设置完成'

while true; do
  read -p '(default doing apt update) Do you want apt upgrade ? (y/n): ' yn
  case $yn in
  [Yy]*)
    sudo apt update && sudo apt upgrade -y
    echo 'System upgrade completed.'
    break
    ;;
  [Nn]*)
    sudo apt update
    echo 'You chose not to upgrade .'
    break
    ;;
  *)
    echo 'Invalid option, please enter y or n.'
    ;;
  esac
done
