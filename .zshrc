# Path to your oh-my-zsh installation.
export ZSH=/home/$(whoami)/.oh-my-zsh
export LANG=en_US.UTF8
export LC_CTYPE=en_US.UTF8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/tools/oss/packages/x86_64-rhel6/tmux/default/bin:/tools/oss/packages/x86_64-rhel6/perl/default/bin:/tools/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/bin/X11:/projects/firepath/apps/bin/:/usr/local/sbin:/opt/dell/srvadmin/bin:/home/cassmay/local/bin:/projects/firepath/apps/bin/:/projects/firepath/tools/bin/:/home/ruperts/work/tools/sbcl/bin:/home/cassmay/.cabal/bin:/home/cassmay/.xmonad/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
# export EDITOR='emacsclient -t'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#export PATH=$PATH:/projects/firepath/apps/bin/:/home/cassmay/bin/:/home/cassmay/bin/bin

export HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=1000000
export EDITOR="vim"
export ALTERNATE_EDITOR=""
export EMACSVER=24.4
export TERM=xterm-256color
export TERMCAP=

hex () {
    python -c "print hex ($1)"
}

int () {
    python -c "print int ($1)"
}

alias ..="cd .."
alias e=emacs
alias ec="emacsclient -t"
alias ed="emacs --daemon"
alias emacs="emacsclient -t"
alias ls="ls --color=auto"
alias ll="ls -hal"
alias g="git"

alias gcn!="git commit --amend --no-edit"
alias gcan!="git commit -a --amend --no-edit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gg="git grep"
alias glgp='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'

bak() {
    cp $1{,.bak}
}

setopt share_history autocd notify
bindkey -e
bindkey \^U backward-kill-line

autoload -U zmv
alias mmv='noglob zmv -W'

# eval solarized dircolors
#eval `dircolors ~/.dir_colors`

# colored completion - use my LS_COLORS
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#source ~/.sh/tmuxinator.zsh

if [ -f ~/.sh/brcm.sh ]
then
    source ~/.sh/brcm.sh
fi
