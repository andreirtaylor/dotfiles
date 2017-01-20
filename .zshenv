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
alias zshrc='v ~/.zshenv'
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

# School stuff
alias school="~/Dropbox/UVic"
alias csc320="~/Dropbox/UVic/CSC320"
alias ceng455="~/Dropbox/UVic/CENG455"
alias seng474="~/Dropbox/UVic/SENG474"
alias csc360="~/Dropbox/UVic/CSC360"
alias csc370="~/Dropbox/UVic/CSC370"
alias sshuvic="ssh artaylor@linux.csc.uvic.ca"

# Go stuff
export GOPATH="$HOME/github/go"

function runNvim {
  args=()
  for var in $@
  do
    touch "$var" &> /dev/null
    ret=$?
    if [ $ret -ne 0 ]; then
      echo "permission denied"
      return -1
    fi
    var="/app$PWD/`realpath --relative-to=$PWD $var`"
    echo $var
    args+=$var
  done

  docker run --workdir="/app/$PWD" \
    --interactive=true\
    --tty \
    -v /:/app \
    --name neovim \
    erroneousboat/neovim $args

  docker rm neovim
}

# This works but isnt really necessary
#alias dvim='runNvim'

# linux-specific aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias chrome="google-chrome-stable 2>>! ~/.log/chrome.log &" # start chrome with logging to a file
  alias redshift="redshift 2>>! ~/.log/redshift.log &" # start redshift with logging to a file
fi
