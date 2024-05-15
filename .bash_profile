# Only source additions to $PATH / env
# if the shell is non-interactive.
source "$HOME/.config/shell/env"
[ -z "$PS1" ] && return
source "$HOME/.bashrc"
