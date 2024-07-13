#!/bin/zsh
echo "This script will install software not managed by MAS or Homebrew"

echo "Installing Xcode command line tools"
xcode-select --install

echo "Installing Homebrew" 
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install Brewfile packages"
brew bundle install --file Brewfile

read -p "Do you want to proceed with the installation of SDKMan? (Y/n): " user_input
if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
    echo "Installing SDKMan..."
    curl -s "https://get.sdkman.io" | zsh
    echo "SDKMan installed."
fi

read -p "Do you want to proceed with the installation of NVM? (Y/n): " user_input
if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
    echo "Installing NVM..."
    curl -o- curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh  | zsh
    echo "NVM installed."
fi
