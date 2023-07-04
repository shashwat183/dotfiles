# PATH VARIABLES
GOLIBPATH=$HOME/GoProjects/golib
GOCODEPATH=$HOME/GoProjects/code
# GOBIN=$GOLIBPATH/bin
GOPATH=$GOLIBPATH:$GOCODEPATH
M2_HOME="/Applications/IntelliJ IDEA CE.app/Contents/plugins/maven/lib/maven3"
MYSQL_HOME=/usr/local/mysql
POSTGRES13=/Applications/Postgres.app/Contents/Versions/13/bin/

PATH=$PATH:$GOLIBPATH/bin:$M2_HOME/bin:$MYSQL_HOME/bin:$POSTGRES13
# PATH=/usr/local/opt/openjdk/bin:$PATH
GLOBAL_LOMBOK_INSTALL=/usr/local/share/lombok

export PATH
export GOPATH
# export GOBIN
export M2_HOME
export MYSQL_HOME
export GLOBAL_LOMBOK_INSTALL

# For compilers to find openjdk
export CPPFLAGS="-I/usr/local/opt/openjdk/include"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

alias commit-history="git log --pretty=oneline"
alias commit-tree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches"
alias get-dns-server-ip="host -a www.google.com | grep from"
alias cn="clear && neofetch"
alias lvim="$HOME/.local/bin/lvim"

if [ -f ~/.local_zprofile ]; then
  source ~/.local_zprofile
fi
