# PATH VARIABLES
GOPATH=/Users/shashwatpragya/GoProjects/golib:/Users/shashwatpragya/GoProjects/code
M2_HOME="/Applications/IntelliJ IDEA CE.app/Contents/plugins/maven/lib/maven3"
MYSQL_HOME=/usr/local/mysql
POSTGRES13=/Applications/Postgres.app/Contents/Versions/13/bin/

PATH=$PATH:$GOPATH/bin:$M2_HOME/bin:$MYSQL_HOME/bin:$POSTGRES13:/Users/shashwatpragya/Scripts:/Users/shashwatpragya/Tools

export PATH
export GOPATH
export M2_HOME
export MYSQL_HOME


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shashwatpragya/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shashwatpragya/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shashwatpragya/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shashwatpragya/google-cloud-sdk/completion.zsh.inc'; fi

alias commit-history="git log --pretty=oneline"
