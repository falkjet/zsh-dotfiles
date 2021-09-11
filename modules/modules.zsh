function list-modules() {
    for file in $ZSH_CONFIG_DIR/modules/*.zsh
    do
        basename $file .zsh
    done
}

function enable-modules() {
    mods="${(@f)"$(ls -b $ZSH_CONFIG_DIR/modules | xargs basename -s .zsh)"}"
    enabledmods=(${(@f)"$(cat $ZSH_CONFIG_DIR/enabled-modules)"})
    mods=(${(@f)"$(comm -23 <(echo ${(F)mods}|sort) <(echo ${(F)enabledmods}|sort))"})
    mods=(${(@f)"$(echo ${(F)mods} | fzf -m)"})
    echo ${(F)mods} >> $ZSH_CONFIG_DIR/enabled-modules
}

function disable-modules() {
    mods=(${(@f)"$(grep -vE '^\s*$' $ZSH_CONFIG_DIR/enabled-modules)"})
    disable_mods=(${(@f)"$(echo ${(F)mods} | fzf -m | cat)"})
    mods=(${(@f)"$(comm -23 <(echo ${(F)mods}|sort) <(echo ${(F)disable_mods}|sort))"})
    echo ${(F)mods} > $ZSH_CONFIG_DIR/enabled-modules
}

function clean-modules() {
    mods="${(@f)"$(ls -b $ZSH_CONFIG_DIR/modules | xargs basename -s .zsh)"}"
    enabledmods=(${(@f)"$(cat $ZSH_CONFIG_DIR/enabled-modules)"})
    enabledmods=(${(@f)"$(comm -12 <(echo ${(F)mods}|sort) <(echo ${(F)enabledmods}|sort))"})
    echo ${(F)enabledmods} > $ZSH_CONFIG_DIR/enabled-modules
}