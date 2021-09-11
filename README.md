# zsh dotfiles

This repository contains my dotfiles for zsh

## Dependencies

- zsh
- fzf
- vim (for the `editor` module)
- nvm (for the `nvm` module)

## Installation

clone the repository

```bash
git clone https://github.com/falkjet/zsh-dotfiles
```

run setup script

```bash
cd zsh-dotfiles
./setup.zsh
```

if you already have a .zshrc it will be moved to `zsh-dotfiles/local/old_zshrc.zsh`

## Modules

Once the dotfiles is installed you can open a zsh shell and call `enable-modules`

Modules are zsh files in the modules directory. All modules listed in the
`enabled-modules` file will be sourced by `.zshrc`. the commands `enable-modules`,
`disable-modules` and `clean-modules` are functions defined in the modules named `modules`.

to disable modules call `disable-modules`
