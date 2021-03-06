
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hmnatzaganian/.oh-my-zsh"

# This line bypasses an issue with fork safety to allow rails console to work
export DISABLE_SPRING=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "amuse", "avit", "gnzh", "intheloop", "jispwoso",
# "jonathan", "murilasso", "refined", "rgm", "rkj-repos", "sporty_256", "steeef",
# "strug", "terminalparty")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set vim as default editor
export VISUAL="vim"
export EDITOR="$VISUAL"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

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

. /Users/hmnatzaganian/.asdf/asdf.sh
. /Users/hmnatzaganian/.asdf/completions/asdf.bash

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# git aliases
alias ga='git add'
alias gap='git add -p'
alias gco='git checkout'
alias goto='git find-branch $@'
alias gpo='git pull origin $(bn)'
alias gs='git status'
alias gb='git branch'
alias gcm='git commit -m'
alias gmm='git merge master'
alias bn='git rev-parse --abbrev-ref HEAD'
alias publish='git push origin HEAD'
alias grm='git rebase master'
alias gcmwtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias gst='git stash'

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

# terminal aliases
alias lessonly='cd ~/Repositories/lessonly'
alias nmres='sudo service network-manager restart'
alias esres='sudo service elasticsearch restart'
# alias rails_secure="rails s -b 'ssl://dev.lvh.me:3000?key=lvh.me.key&cert=lvh.me.crt'"
alias rails_secure="rails s -b 'ssl://dev.lvh.me:3000?key=server.key&cert=server.crt'"
alias be='bundle exec'
alias dnsmasq='/etc/init.d/dnsmasq'
alias kill-rails='sudo kill -9 $(lsof -i :3000 -t)'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
