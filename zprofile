# Core environment
export EDITOR="nvim"

# GO ENVIRONMENT VARIABLES
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GOCACHE="$HOME/.cache/go-build"

# Shared PATH additions
path=(
  "$HOME/.local/bin"
  "$HOME/.local/scripts"
  $path
)

export PATH

if [ -f ~/.local_zprofile ]; then
  source ~/.local_zprofile
fi
