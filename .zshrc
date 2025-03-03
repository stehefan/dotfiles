eval "$(starship init zsh)"

function _source_if_exists {
  [ -f "${1}" ] && source "${1}" "${2}"
}

# Load tooling
_source_if_exists "$HOME/.sdkman/bin/sdkman-init.sh"
_source_if_exists "$NVM_DIR/nvm.sh"
_source_if_exists "$NVM_DIR/bash_completion"
_source_if_exists "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
_source_if_exists "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
_source_if_exists "$HOME/.orbstack/shell/init.zsh"
_source_if_exists "$HOME/.cargo/env"
source <(fzf --zsh)

# General configuration
bindkey -e                                                        # enable emacs keybindings

# History
HISTFILE=$HOME/.zsh_history                                       # path to history file; needed for shared history
HISTSIZE=10000                                                    # read up to $HISTSIZE lines
SAVEHIST=10000                                                    # write up to $SAVEHIST lines
setopt hist_ignore_all_dups                                       # delete old entries if new entry is a duplicate
setopt hist_verify                                                # don't execute immediately upon history expansion
setopt inc_append_history                                         # write to history immediately, not on shell exit
setopt print_exit_value                                           # print non-zero exit values
setopt share_history                                              # share history between all sessions

# Completion Engine
autoload -U compinit && compinit                                  # enable completion engine
setopt complete_in_word                                           # completion
zstyle ':completion:*' matcher-list '' \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'    # partial completion
zstyle ':completion:*' menu select                                # highlight entries on tab

# Aliases
## General
alias reload="source ~/.zshrc && source ~/.zprofile"

## Files & directories
alias l="ls -la" 
alias p="cd ~/projects"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

## Git
alias ga="git add"
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias pullo='git pull -r origin `git rev-parse --abbrev-ref HEAD`'
alias pusho='git push origin `git rev-parse --abbrev-ref HEAD`'

# Source additional zshrc content
_source_if_exists "$HOME/.zshrc.local"

# Autoload node version based on .nvmrc
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
