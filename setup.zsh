#!/bin/zsh
ZSH_CONFIG_DIR=$(dirname $(readlink -f $0))

mkdir -p $ZSH_CONFIG_DIR/local
if [ ! -f $ZSH_CONFIG_DIR/enabled-modules ]
then
    echo modules > $ZSH_CONFIG_DIR/enabled-modules
fi

if [ -f ~/.zshrc ]
then
    [ $(readlink -f ~/.zshrc) = $ZSH_CONFIG_DIR/.zshrc ] && exit 0;
    mv ~/.zshrc $ZSH_CONFIG_DIR/local/old_zshrc.zsh
fi
ln -s $ZSH_CONFIG_DIR/.zshrc ~/.zshrc
