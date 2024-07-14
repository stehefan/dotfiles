#/!bin/zsh
set -e

function link_file {
    echo "Linking $1"

    [ -f $1 ] && cp $1 $1.bak
    ln -fs $(pwd)/$1 $1
}

# Initialise config-dir if not already present
mkdir -p ~/.config 

# Setting default shell
echo "Set the default shell to zsh managed with brew"
sudo /bin/zsh -c 'echo "$(brew --prefix zsh)/bin/zsh" >> /etc/shells'
chsh -s $(brew --prefix zsh)/bin/zsh $(whoami)

# Linking config files
link_file ~/.gitconfig
link_file ~/.gitignore.global
link_file ~/.config/starship.toml
link_file ~/.zshrc
link_file ~/.zprofile
link_file ~/.vimrc
