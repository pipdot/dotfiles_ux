# Only source additions to $PATH / env
# if the shell is non-interactive.
source "$HOME/.config/shell/env"
[ -z "$PS1" ] && return
# for interactive shell
source "$HOME/.config/shell/bash/intv"
