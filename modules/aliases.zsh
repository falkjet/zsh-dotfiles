alias ls='ls --color=auto'
alias speed-dreams="gtk-launch speed-dreams-svn"
alias nanosudo="sudo EDITOR=nano visudo"

alias restart="clear; exec zsh"
alias tmux='systemd-run --scope --user tmux -2'
alias grep='grep --color'
alias la='ls -la'
alias lA='ls -lA'
alias clip="xclip -selection c"
alias paste="xclip -selection c -o"
alias clipcwd="pwd | xclip -selection c"
alias cdclip='cd $(xclip -selection c -o)'
alias prisma="npx prisma"