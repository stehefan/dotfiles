#/!bin/zsh
set -e

function link_file {
    local source=$1
    local destination=$2

    if [[ $destination == "" ]]; then
      destination="$HOME/$source"
    fi
    local destdir=$(dirname "$destination")

    [ ! -d "$destdir" ] && echo "Creating directory $destdir" && mkdir -p "$destdir"
    [ -f "$destination" ] && [ ! -L "$destination" ] && echo "Backing up $destination to $destination.bak" && cp "$destination" "$destination.bak"
    
    if [ ! -L "$destination" ]; then
      echo "Linking $source to $destination"
      ln -fs $(pwd)/$source $destination
    else
      echo " $destination is already linked"
    fi
}

# Initialise config-dir if not already present
mkdir -p ~/.config 

# Setting default shell
brewZsh=$(brew --prefix zsh)/bin/zsh
if [[ "$SHELL" != *"$brewZsh"* ]]; then
  echo "Set the default shell to zsh managed with brew"
  sudo /bin/zsh -c "echo '$brewZsh' >> /etc/shells"
  chsh -s $(brew --prefix zsh)/bin/zsh $(whoami)
fi

# Linking config files
link_file .gitconfig
link_file .gitignore.global
link_file starship.toml ~/.config/starship.toml
link_file .zshrc
link_file .zprofile
link_file .vimrc
link_file ghostty.config ~/.config/ghostty/config
link_file .gitaliases
