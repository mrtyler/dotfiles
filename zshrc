# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Uncomment the following line to use case-sensitive completion.
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
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PAGER=less
###export PS1='\[\e[1;32m\][\u@\h:\w\[\e[0m\] \[\e[1;33m\]$(parse_git_branch)\[\e[0m\]\[\e[1;32m\]\]]\$ \[\e[0m\]'
export PATH=$PATH:/opt/homebrew/bin:$HOME/bin
export VISUAL=vi

alias grlo="ssh root@localhost"
alias gtlo="ssh $USER@localhost"
###alias colorprompt="export PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\] '"
###alias plainprompt="export PS1='[\u@\h \w]\$ '"

alias ag='export IGNOREEOF=3 ; exec ssh-agent zsh'
ad()
{
    if [ -z "$SSH_IDENTITY" ]
    then
        echo 'No SSH_IDENTITY specified!'
        ssh-add
    else
        for id in $SSH_IDENTITY
        do
            ssh-add $id
        done
    fi
}

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias screen='TERM=screen screen'

# This pretty much assumes GNU ls
alias ls="ls --color=auto"

# Try to find a useful vi
if `which vim > /dev/null 2>&1`
then
    vi='vim'
    alias ivi="vim -i NONE --cmd 'set noswapfile' --cmd 'set nobackup' -u NONE -U NONE"
elif `which nvi > /dev/null 2>&1`
then
    vi='nvi'
else
    echo "Couldn't find an enhanced vi." > /dev/stderr
    vi='vi'
fi

alias vi=$vi
export VISUAL=$vi
export EDITOR=$vi

alias randomize="perl -MList::Util=shuffle -e'print shuffle<>'"
alias sortr="ls | perl -MList::Util=shuffle -e'print shuffle<>' | xargs less"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#### Stupid openssh workaround
###shopt -s huponexit

# for tmux-resurrect, but seems generally helpful
# bash: HISTCONTROL=ignoreboth
# zsh, per https://www.reddit.com/r/zsh/comments/2aoy2i/history_deduplication/ :
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# manually fix tmux ssh auth sock
alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'
export GPG_TTY=$(tty)

umask 007

# https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# https://github.com/pyenv/pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Need to fix this up but stupid _openstack thing is getting in the way of my tab completion
alias openstack='openstack'

# 2023-03-19 Full path in prompt
export PS1=$(echo $PS1 | sed -e 's,%c,%~,g')
