#!/bin/sh

if [ -x "$(command -v ~/.local/bin/mise)" ]; then
  eval "$(~/.local/bin/mise activate zsh)"
elif [ -x "$(command -v mise)" ]; then
  eval "$(mise activate zsh)"
fi

