# .profile
# First load system-wide profile
# should be done automatically..
# FIXME: but it's not, sooo..
[ -f "/etc/profile" ] && . "/etc/profile"

. "$HOME/.config/shell/shell_env"
