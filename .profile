# .profile
# First load system-wide profile
# should be done automatically..
# FIXME: but it's not, sooo..
[ -f "/etc/profile" ] && . "/etc/profile"

# note: no need to export it,
# it only needs to be available in the following functions
# which _are_ available in parent processes
SHELL_PROFILE_CONFIG_DIR="$HOME/.config/shell"

source_shell_file() {
  for file in "$@"; do
    [ -f "${file}" ] && . "${file}"
  done
}

source_shell_module() {
  for file in "$@"; do
    [ -f "${file}" ] && . "${file}"
    [ -f "${file}.user" ] && . "${file}.user"
    [ -f "${file}.local" ] && . "${file}.local"
  done
}

source_shell_module "$SHELL_PROFILE_CONFIG_DIR/shell_env"
