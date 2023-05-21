# .profile
# First load system-wide profile
[ -f "/etc/profile" ] && . "/etc/profile"

# note: no need to export it,
# it only needs to be available in the following functions
# which _are_ available in parent processes
SHELL_PROFILE_CONFIG_DIR="$HOME/.config/shell"

source_shell_file() {
  for file in "$@"; do
    [ -f "$SHELL_PROFILE_CONFIG_DIR/${file}" ] && . "$SHELL_PROFILE_CONFIG_DIR/${file}"
  done
}

source_shell_module() {
  for file in "$@"; do
    [ -f "$SHELL_PROFILE_CONFIG_DIR/${file}" ] && . "$SHELL_PROFILE_CONFIG_DIR/${file}"
    [ -f "$SHELL_PROFILE_CONFIG_DIR/${file}.user" ] && . "$SHELL_PROFILE_CONFIG_DIR/${file}.user"
    [ -f "$SHELL_PROFILE_CONFIG_DIR/${file}.local" ] && . "$SHELL_PROFILE_CONFIG_DIR/${file}.local"
  done
}
source_shell_module "shell_env"

