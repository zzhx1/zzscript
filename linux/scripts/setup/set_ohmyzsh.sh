#!/bin/bash
# Minimal Oh My Zsh install script: Try curl → wget → fetch in order, exit on first success

# Array of install commands (prioritized order)
install_cmds=(
  "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/zzhx1/ohmyzsh/master/tools/install.sh)\""
  "sh -c \"\$(wget -O- https://raw.githubusercontent.com/zzhx1/ohmyzsh/master/tools/install.sh)\""
  "sh -c \"\$(fetch -o - https://raw.githubusercontent.com/zzhx1/ohmyzsh/master/tools/install.sh)\""
)

# Iterate through commands: execute & exit if successful
for cmd in "${install_cmds[@]}"; do
  echo "Trying command: $cmd"
  eval "$cmd" && exit 0  # Exit with 0 (success) if command runs without error
done

# Exit with error if all commands fail
echo "All installation methods failed!" && exit 1
