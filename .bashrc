# Only source additions to $PATH
# if the shell is non-interactive.
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -z "$PS1" ] && return

# for interactive shell
source_shell_file "$SHELL_PROFILE_CONFIG_DIR/shell_rc"
# module loading (Order matters)
source_shell_module "$SHELL_PROFILE_CONFIG_DIR/bash/modules/*"
source_shell_file "$SHELL_PROFILE_CONFIG_DIR/bash/completion/bash_completion"

# FIXME: RUN TMUX AT ALACRITTY STARTUP INSTEAD
# Run tmux if found
# Run after files so that it gets the environment variables defined above
# from: https://unix.stackexchange.com/a/113768
# Attach to last session if it exists
# see: https://unix.stackexchange.com/a/176885
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux new -As0
# fi


