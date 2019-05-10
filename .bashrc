# Personal Bash config

force_color_prompt=yes

source .bashrc_local

# construct prompt script 1
if [[ "$OSTYPE" != "darwin16"* ]]; then # This doesn't work on MacOS
    source ~/.git-prompt.sh
    branch='\[\033[0;33m\]$(__git_ps1 "(%s) \r\f")'; # orange
else
    branch=''
fi
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
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'

eval $(thefuck --alias)

# Make SSH_AUTH_SOCK persistant for tmux & screen so that new 
# SSH agents created by subsequent logons are still usable
_ssh_auth_save() {
    ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock.$HOSTNAME"
}
alias screen='_ssh_auth_save ; export HOSTNAME=$(hostname) ; screen'
alias tmux='_ssh_auth_save ; export HOSTNAME=$(hostname) ; tmux'
