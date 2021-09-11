# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

emulate -LR zsh

ZSH_CONFIG_DIR=$(dirname $(readlink -f ~/.zshrc))
export ZSH_CONFIG_DIR

for file in $ZSH_CONFIG_DIR/local/*.zsh; do source $file; done
[ ! -f $ZSH_CONFIG_DIR/enabled-modules ] && echo modules > $ZSH_CONFIG_DIR/enabled-modules
mods=(${(f)"$(cat $ZSH_CONFIG_DIR/enabled-modules)"})
for mod in $mods
do
  source $ZSH_CONFIG_DIR/modules/${mod}.zsh
done

autoload compinit
compinit -y

