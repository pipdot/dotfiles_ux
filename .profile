# .profile
# First load system-wide profile
[ -f "/etc/profile" ] && . "/etc/profile"

# note: no need to export it,
# it only needs to be available in the following functions
# which _are_ available in parent processes
PROFILE_CONFIG_DIR="$HOME/.config/profile"

source_profile_file() {
  for file in "$@"; do
    [ -f "$PROFILE_CONFIG_DIR/${file}" ] && . "$PROFILE_CONFIG_DIR/${file}"
  done
}

source_profile_module() {
  for file in "$@"; do
    [ -f "$PROFILE_CONFIG_DIR/${file}" ] && . "$PROFILE_CONFIG_DIR/${file}"
    [ -f "$PROFILE_CONFIG_DIR/${file}.user" ] && . "$PROFILE_CONFIG_DIR/${file}.user"
    [ -f "$PROFILE_CONFIG_DIR/${file}.local" ] && . "$PROFILE_CONFIG_DIR/${file}.local"
  done
}
source_profile_module "profile_exports"

