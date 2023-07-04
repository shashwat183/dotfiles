# -- enable bash autocompletion in zsh --
autoload -U +X bashcompinit && bashcompinit

# --------------------------------------------------------------------------- #
# Plugins
# --------------------------------------------------------------------------- #

# -- zsh vi mode(better than default) --
if  [ -f ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh ]; then
  source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
else
  echo "zsh-vi-mode not found, please install"
fi

# -- zsh autosuggestions --
if  [ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  bindkey '^ ' autosuggest-accept
else
  echo "zsh-autosuggestions not found, please install"
fi

# -- fast syntax highlighting --
if  [ -f ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
  source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
else
  echo "fast-syntax-highlighting not found, please install"
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

# --------------------------------------------------------------------------- #
# aliases
# --------------------------------------------------------------------------- #
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

bindkey -v
bindkey '^ ' autosuggest-accept

# -- Support for Local zshrc --
if [ -f ~/.local_zshrc ]; then
  source ~/.local_zshrc
fi
