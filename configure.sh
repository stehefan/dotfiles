#/!bin/zsh
set -e

echo "Set the default shell to zsh managed with brew"
sudo /bin/zsh -c 'echo "$(brew --prefix zsh)/bin/zsh" >> /etc/shells'
chsh -s $(brew --prefix zsh)/bin/zsh $(whoami)

echo "Set git config"
git config --global user.name "Stefan Lier"
git config --global user.email "lier.stefan@gmail.com"

echo "Initialise Starship Config"
mkdir -p ~/.config && ln -fs $(pwd)/starship.toml ~/.config/starship.toml

echo "Linking .zshrc"
cp ~/.zshrc ~/.zshrc.bak
ln -fs $(pwd)/.zshrc ~/.zshrc

echo "Linking .zprofile"
cp ~/.zprofile ~/.zprofile.bak
ln -fs $(pwd)/.zprofile ~/.zprofile

echo "Linking .vimrc"
cp ~/.vimrc ~/.vimrc.bak
ln -fs $(pwd)/.vimrc ~/.vimrc