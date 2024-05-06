# Only source additions to $PATH
# if the shell is non-interactive.
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -z "$PS1" ] && return

# for interactive shell
source_shell_file $SHELL_PROFILE_CONFIG_DIR/rc/*
source_shell_file $SHELL_PROFILE_CONFIG_DIR/bash/modules/*
source_shell_file "$SHELL_PROFILE_CONFIG_DIR/bash/completion/bash_completion"
