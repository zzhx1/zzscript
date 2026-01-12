
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

cd "$SCRIPT_DIR" || exit 1

# 1. 确保 vimrc.txt 和 plug.vim 文件存在
if [ ! -f vimrc.txt ]; then
    echo "vimrc.txt 文件未找到!"
    exit 1
fi

if [ ! -f plug.vim ]; then
    echo "plug.vim 文件未找到!"
    exit 1
fi

cat vimrc.txt > ~/.vimrc
mkdir -p ~/.vim/autoload

cp ./plug.vim ~/.vim/autoload/

vim +PlugInstall +qall


echo "配置已成功写入 ~/.vimrc 文件并生效。"

