#!/bin/zsh
ZSH_CONFIG_DIR=$(dirname $(readlink -f $0))

mkdir -p $ZSH_CONFIG_DIR/local
touch $ZSH_CONFIG_DIR/enabled-modules

if [ -f ~/.zshrc ]
then
    [ $(readlink -f ~/.zshrc) = $ZSH_CONFIG_DIR/.zshrc ] && exit 0;
    mv ~/.zshrc $ZSH_CONFIG_DIR/local/old_zshrc.zsh
fi
ln -s $ZSH_CONFIG_DIR/.zshrc ~/.zshrc