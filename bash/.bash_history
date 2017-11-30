\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.2.3
source /Users/jenniferhamilton/.rvm/scripts/rvm
rvm install 2.2.3
rvm install 2.4.0
rvm list known
rvm --default use 2.2.3
brew -v
brew update
brew doctor
brew install node
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
command -v zsh | sudo tee -a /etc/shells
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
sudo chsh -s "$(command -v zsh)" "${USER}"
