# Personal Bash config

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

# construct prompt script 1
source ~/.git-prompt.sh
branch='\[\033[0;33m\]$(__git_ps1 "(%s) \r\f")'; # orange
user="\[\033[1;35m\]\u"; # light magenta
host="\[\033[0;34m\]\h"; # blue
working="\[\033[0;32m\]\w"; # green

PS1=${branch}${user}"\[\033[0;39m\]@"${host}"\[\033[0;39m\]:"${working}" \[\033[0m\]$ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
