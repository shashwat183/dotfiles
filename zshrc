# Shared interactive shell config

# Machine-specific completion setup that must run before compinit
[[ -f "$HOME/.local_zshrc_completions" ]] && source "$HOME/.local_zshrc_completions"

# User-installed zsh completion functions
[[ -d "$HOME/.local/share/zsh/site-functions" ]] && fpath=("$HOME/.local/share/zsh/site-functions" $fpath)

# Homebrew zsh completion functions
[[ -d /opt/homebrew/share/zsh/site-functions ]] && fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Initialize zsh completion after all completion directories have been added to fpath
autoload -Uz compinit
compinit

# Menu select for completions
zstyle ':completion:*' menu select

# Disable terminal bell for interactive shells
unsetopt BEEP

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

# Execute these plugins after zsh vi mode to make sure keybindings are not
# overwritten.
function zvm_after_init() {
  # -- zsh autosuggestions --
  if  [ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey '^ ' autosuggest-accept
    bindkey '^l' forward-word
  else
    echo "zsh-autosuggestions not found, please install"
  fi

  # -- zsh-fzf-search-history --
  if  [ -f ~/.zsh/plugins/fzf/fzf.zsh ]; then
    source ~/.zsh/plugins/fzf/fzf.zsh
  else
    echo "fzf.zsh not found, please install"
  fi

  # -- zsh-history-substring-search --
  if  [ -f ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh ]; then
    source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  else
    echo "zsh-history-substring-search not found, please install"
  fi
}

# -- fast syntax highlighting --
if  [ -f ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
  source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
else
  echo "fast-syntax-highlighting not found, please install"
fi

# -- zsh-z --
if  [ -f ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh ]; then
  source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh
else
  echo "zsh-z not found, please install"
fi

# -- Starship prompt theme --
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  echo "starship prompt not found, please install"
fi

# --------------------------------------------------------------------------- #
# aliases
# --------------------------------------------------------------------------- #

# Prefer eza for ls if available
if command -v eza &> /dev/null; then
  alias ls="eza -g --color=always --group-directories-first --icons"
else
  echo "command eza not found, please install"
fi

# Prefer ccat for cat if available
if command -v ccat &> /dev/null; then
  alias cat="ccat"
else
  echo "command ccat not found, please install"
fi

# Use trash instead of rm on macOS if available
if command -v trash &> /dev/null; then
  alias rm=trash
else
  echo "command trash not found, please install"
fi

# Machine-specific interactive shell config
[[ -f "$HOME/.local_zshrc" ]] && source "$HOME/.local_zshrc"
