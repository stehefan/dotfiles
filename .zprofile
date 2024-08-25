# Export Homebrew shell environment
eval $(/opt/homebrew/bin/brew shellenv)

# Exports
export PATH="$PATH:/Users/${whoami}/bin:/opt/local/bin:/opt/local/sbin"
export MANPATH="/opt/local/share/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LANG=en_US.UTF-8
export EDITOR='vim'
export CASE_SENSITIVE="true"
export ZSH_THEME="robbyrussell"
export COMPLETION_WAITING_DOTS="true"
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

if [ -f ~/.zprofile.local ]; then
  source ~/.zprofile.local
fi
