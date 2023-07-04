# -- enable bash autocompletion in zsh --
autoload -U +X bashcompinit && bashcompinit

# -- zsh autosuggestions --
if  [ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  bindkey '^ ' autosuggest-accept
else
  echo "zsh-autosuggestions not found, please install"
fi

# -- zsh syntax highlighting --
if  [ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "zsh-syntax-highlighting not found, please install"
fi

# -- Starship prompt theme --
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  echo "starship prompt not found, please install"
fi

# -- Set Editor - neovim if found else vim --
if command -v nvim &> /dev/null; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# -- use exa for ls --
if command -v exa &> /dev/null; then
  alias ls="exa -g --color=always --group-directories-first --icons"
fi

# -- global aliases --
alias py='python'
alias ll="ls -la"
alias zsource='source ~/.zshrc'
alias dkr='docker'
# some ls aliases
alias lg="ls -l --git"
alias la="ls -lah"
alias l="ls -l"

# safer rm, trash puts files/folders into trash (macos only)
alias rm=trash

# take = create a new dir and cd into it.
function take {
  mkdir -p $1
  cd $1
}

# -- Support for Local zshrc --
if [ -f ~/.local_zshrc ]; then
  source ~/.local_zshrc
fi

