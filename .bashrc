# Only source additions to $PATH
# if the shell is non-interactive.
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
# Also load bash-specific exports
source_shell_module "bash/bash_exports"
[ -z "$PS1" ] && return

# for interactive shell
source_shell_file "shell_rc"
# module loading (Order matters) :ARCANE:
source_shell_module "bash/bash_aliases" "bash/bash_functions" "bash/bash_keys" "bash/bash_browsing" "bash/bash_prompt"
source_shell_file "bash/bash_completion"

# FIXME: RUN TMUX AT ALACRITTY STARTUP INSTEAD
# Run tmux if found
# Run after files so that it gets the environment variables defined above
# from: https://unix.stackexchange.com/a/113768
# Attach to last session if it exists
# see: https://unix.stackexchange.com/a/176885
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux new -As0
# fi


