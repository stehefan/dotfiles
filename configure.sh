#/!bin/zsh
set -e

function link_file {
    local source=$1
    local destinationFolder=$2

    if [[ $destinationFolder == "" ]]; then
      destinationFolder="$HOME"
    fi

    echo "Linking $source to $destinationFolder/$source"

    [ -f $destinationFolder ] && cp $destinationFolder $destinationFolder.bak
    ln -fs $(pwd)/$source $destinationFolder
}

# Initialise config-dir if not already present
mkdir -p ~/.config 

# Setting default shell
echo "Set the default shell to zsh managed with brew"
sudo /bin/zsh -c 'echo "$(brew --prefix zsh)/bin/zsh" >> /etc/shells'
chsh -s $(brew --prefix zsh)/bin/zsh $(whoami)

# Linking config files
link_file .gitconfig
link_file .gitignore.global
link_file starship.toml ~/.config
link_file .zshrc
link_file .zprofile
link_file .vimrc
