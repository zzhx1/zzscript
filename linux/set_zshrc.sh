

echo "
####### custom alias #####
mkcd() {
    mkdir -p "$1" && cd "$1"
}

alias ctar='tar -czvf'
alias xtar='tar -xzvf'
" | tee -a ~/.zshrc
