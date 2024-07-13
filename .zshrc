eval "$(starship init zsh)"

[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
[ -s "$HOME/.orbstack/shell/init.zsh" ] && source "$HOME/.orbstack/shell/init.zsh"
[ -s "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
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
alias gdc="git diff --cached"

# Configure ZSH
bindkey -v
bindkey '^R' history-incremental-search-backward

# Source additional zshrrc content
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi