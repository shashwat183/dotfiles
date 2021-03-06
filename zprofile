# PATH VARIABLES
GOPATH=$HOME/GoProjects/golib:$HOME/GoProjects/code
M2_HOME="/Applications/IntelliJ IDEA CE.app/Contents/plugins/maven/lib/maven3"
MYSQL_HOME=/usr/local/mysql
POSTGRES13=/Applications/Postgres.app/Contents/Versions/13/bin/

PATH=$PATH:$GOPATH/bin:$M2_HOME/bin:$MYSQL_HOME/bin:$POSTGRES13
# PATH=/usr/local/opt/openjdk/bin:$PATH
GLOBAL_LOMBOK_INSTALL=/usr/local/share/lombok

export PATH
export GOPATH
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
alias get-dns-server-ip="host -a www.google.com | grep from"
alias cn="clear && neofetch"
alias lvim="$HOME/.local/bin/lvim"

if [ -f ~/.local_zprofile ]; then
  source ~/.local_zprofile
fi
