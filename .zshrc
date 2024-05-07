# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# some stuff for interactive shells.
source_shell_file $SHELL_PROFILE_CONFIG_DIR/rc/*

# Path to your oh-my-zsh installation.
export ZSH_ROOT="$HOME/.config/shell/zsh"
export ZAP_ROOT="$HOME/.local/share/zap"
# export ZSH="$ZSH_ROOT/oh-my-zsh"
export ASDF_DIR="$HOME/.asdf"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM="$ZSH_ROOT/plugins"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   command-not-found
#   aliases
#   colorize
#   vi-mode
#   fzf
#   zsh-navigation-tools
#   git
#   thefuck
#   tmux
#   tmuxinator
#   vscode
# )
# source $ZSH/oh-my-zsh/oh-my-zsh.sh
#
## ZAP
source $ZAP_ROOT/zap.zsh
#
# plug-ins configuration
TMUX_MOTD=false
TMUX_AUTOSTART=false

# Load and initialise completion system
plug "zsh-users/zsh-completions"
autoload -Uz compinit
compinit

# must be after completion
# and before autosuggestions and highlights
# plug "Aloxaf/fzf-tab"

plug "zap-zsh/supercharge"
# plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zdharma-continuum/fast-syntax-highlighting"
#
plug "MichaelAquilina/zsh-you-should-use"
plug "zpm-zsh/clipboard"
#
# plug "jeffreytse/zsh-vi-mode"
# plug "softmoth/zsh-vim-mode"
plug "zap-zsh/vim"
# Apparently zsh does not set delete key binding correctly?
# this plug-in does it for us.
# plug "kytta/ohmyzsh-key-bindings"
plug "zpm-zsh/tmux"
plug "unixorn/fzf-zsh-plugin"
#
# this one requires that compinit be called before and not after.
# plug "zimfw/asdf"
# plug 'redxtech/zsh-asdf-direnv'
#
plug "mdumitru/git-aliases"
plug "dashixiong91/zsh-vscode"
# fix del key and others
plug "$ZSH_CUSTOM/zsh-fixkeys/fixkeys.plugin.zsh"
# this also work but zap complains about
# it not being activated...
# plug "$ZSH_CUSTOM/zsh-fixkeys"
# TODO: find out how to install plug-in from oh-my-zsh.
# see list here: https://github.com/unixorn/awesome-zsh-plugins#generic-zsh


# User configuration
#  use asdf-direnv?
#
# source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
# Setup fzf
# ---------
if [[ ! "$PATH" == *${FZF_PATH}/bin* ]]; then
  export PATH="$PATH:${FZF_PATH}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_PATH}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "${FZF_PATH}/shell/key-bindings.zsh"


# zmv
# for future use,
# batch renaming of nested files with zmv,
# see: https://benfrain.com/batch-rename-nested-files-and-folders-on-macos-with-zsh/
autoload -U zmv
alias zcp='zmv -p cp'
alias zln='zmv -p ln'
alias gmv='noglob zmv -W'
alias gcp='noglob zmv -W -p cp'
alias gln='noglob zmv -W -p ln'

# powerline-status
# MUST BE SOURCED AFTER oh-my-zsh,
# otherwise it won't work.
if command -v powerline-daemon &> /dev/null; then
  powerline-daemon -q
  source "${POWERLINE_ROOT}/bindings/zsh/powerline.zsh"
fi
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
