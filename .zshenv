# General Aliases
alias vim=nvim
alias v=vim
export XDG_CONFIG_HOME="$HOME/.config"
alias clipboard="xclip -selection clipboard"

# Directory Traversal
alias boolean="cd ~/github/boolean"
alias github='cd ~/github'
alias godir='cd $GOPATH/src/github.com/andreirtaylor'
alias ctci="~/Dropbox/Programming/ctci"
alias dotfiles="~/github/dotfiles"
alias fertC="~/$GOPATH/src/github.com/andreirtaylor/fertileCrescent"
alias kaa="~/github/Kaa"


# Commands
alias rs="exec $SHELL -l"
alias cl="clear"
alias kr="ps aux | grep redshift | grep -v grep | awk '{print \$2}' | xargs kill"
alias rnm="sudo systemctl restart NetworkManager.service"
alias weka="java -jar  ~/weka-3-8-1/weka.jar"

# Fzy stuff
alias s='ag . -l -g "" | fzy'
alias vs='v $(s)'

# Node stuff
alias npmrs="npm run-script"

# Edit config files
alias zshenv='v ~/.zshenv'
alias zshrc='v ~/.zshrc'
alias vrc='v ~/.config/nvim/init.vim'

# Git aliases
alias gpo="git push origin HEAD:refs/for/master"
alias gcam='git commit -am '

# Docker stuff
alias dcu="docker-compose up"
alias dcb="docker-compose build"
alias dcr="dcb && dcu"
alias nwrs="sudo service network-manager restart"
alias drmall='docker rm -f $(docker ps -a -q)'
alias drmiall='docker rmi -f $(docker images -q)'
alias bsr="docker run -it -p 4000:4000 battle_snake_server"
alias bsd="docker build --rm -t battle_snake_server ."

# School stuff
alias school="~/Dropbox/UVic"
alias seng426="~/Dropbox/UVic/SENG426"
alias seng440="~/Dropbox/UVic/SENG440"
alias seng499="~/Dropbox/UVic/SENG499"
alias seng480a="~/Dropbox/UVic/SENG480A"
alias seng480c="~/Dropbox/UVic/SENG480C"
alias sshuvic="ssh artaylor@linux.csc.uvic.ca"

# Go stuff
export GOPATH="$HOME/github/go"

# NW Hacks
alias sshmypi="ssh -i '~/Dropbox/mypinotify.pem' ubuntu@ec2-54-218-109-214.us-west-2.compute.amazonaws.com"
alias sshmypidb="ssh -i '~/Dropbox/mypinotify.pem' ec2-user@ec2-54-213-87-4.us-west-2.compute.amazonaws.com"
alias sshmypidb2="ssh -i '~/Dropbox/mypinotify.pem' ec2-user@ec2-54-187-185-157.us-west-2.compute.amazonaws.com"

# linux-specific aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias chrome="google-chrome-stable 2>>! ~/.log/chrome.log &" # start chrome with logging to a file
  alias redshift="redshift 2>>! ~/.log/redshift.log &" # start redshift with logging to a file
fi

function hist {
  history | sed 's/^\s*[0-9]\+\s*//' | fzy
}

function get_my_history {
  eval hist
}

export AWS_ACCESS_KEY_ID="AKIAIOO3K7B7TB5LJI5A"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_REGION="us-west-2"


zle -N get_my_history
bindkey '^R' get_my_history 
