# Only source additions to $PATH
# if the shell is non-interactive.
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
# Also load bash-specific exports
source_profile_module "bash_exports"
[ -z "$PS1" ] && return

shopt -s histappend                            # Add history from all the terminal opened
shopt -s checkwinsize                          # Keep checking terminal size
if [ $BASH_VERSINFO -ge 4 ]; then
  shopt -s globstar                            # ** enabled
  shopt -s autocd                              # Type the directory name and cd it
fi
set -o vi                                      # VI mode readline
stty -ixon                                     # Set forward searching

# module loading (Order matters) :ARCANE:
source_profile_module "bash_aliases" "bash_functions" "bash_prompt"
source_profile_file "bash_completion"

# FIXME: RUN TMUX AT ALACRITTY STARTUP INSTEAD
# Run tmux if found
# Run after files so that it gets the environment variables defined above
# from: https://unix.stackexchange.com/a/113768
# Attach to last session if it exists
# see: https://unix.stackexchange.com/a/176885
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux new -As0
# fi

