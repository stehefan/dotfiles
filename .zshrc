eval "$(starship init zsh)"

function _source_if_exists {
  [ -f "${1}" ] && source "${1}" "${2}"
}

# Load tooling
_source_if_exists "$HOME/.sdkman/bin/sdkman-init.sh"
_source_if_exists "$NVM_DIR/nvm.sh"
_source_if_exists "$NVM_DIR/bash_completion"
_source_if_exists "$HOME/.orbstack/shell/init.zsh"
_source_if_exists "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source <(fzf --zsh)

# History
bindkey '^R' history-incremental-search-backward                  # ctrl-r to search history
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

# Incremental Search with Arrow Keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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
alias gpom="git push origin main"
alias gd="git diff"
alias gdc="git diff --cached"

# Source additional zshrc content
_source_if_exists "$HOME/.zshrc.local"
