#bash
chsh -s /bin/bash


echo "Creating an SSH key for you..."
ssh-keygen -t rsa -b 8192

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

#git config --global user.name "adambrace"
#git config --global user.email <email>


echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tig
brew install tree
brew install wget
brew install trash
brew install svn
brew install node
brew install python
brew install imagemagick
brew install htop-osx
brew install the_silver_searcher
brew install gist
brew install shellcheck
brew install mas
brew install pwgen
brew install jq

#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install cask


echo "Grunting it up"
npm install -g grunt-cli

# Apps
apps=(
# alfred
 firefox
 #private-internet-access
 bartender
 #harvest
 #qlcolorcode  #markdown
 #suspicious-package
 #bettertouchtool
 #hipchat
 #qlmarkdown #markdown
 #transmission
 iterm2
 #qlstephen  #markdown
 #transmit
 #cleanmymac
 #razer-synapse
 #vagrant
 docker
 #sequel-pro
 #virtualbox
 #google-chrome
 #skype
 #vlc
 #nvalt
 sourcetree
 #zoomus
 dropbox
 #spotify
 #macdown #markdown
 #macvim
 slack
 visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask ${apps[@]}

brew install --cask alfred

brew cleanup


echo "Installing some things from the Mac App Store..."
# Mac App Store downloads via mas
####  mas search Xcode
####    497799835 Xcode
####    688199928 Docs for Xcode
####  mas install 808809998

####  If you want to install the first result that the search command would prompt you:
####  mas lucky twitter

#Microsoft Remote Desktop 10 (10.2.0)
mas install 1295203466
# mas lucky "Remote Desktop 10"

#Trello
#mas install 1278508951


#end MAS Installs

echo "Installing AWS CLI..."
#AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
#End AWS CLI

git clone https://github.com/dracula/terminal-app.git

echo "Setting some Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Enable screenshot shadow"
defaults write com.apple.screencapture disable-shadow -bool false

#"Adjust Screenshot Location"
defaults write com.apple.screencapture location Users/<user>/Pictures/Screenshots/

#"Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

#"Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

#"Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#"Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#"Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

#"Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

#Set terminal to use Dracula
open terminal-app/Dracula.terminal
defaults write com.apple.terminal "Default Window Settings" "Dracula"


echo "Setting some VS-Code settings..."
#vs-code config
#Extension Dependencies
pip3 install cfn-lint

#extensons
#VSCODE
#(node:26049) [DEP0005] DeprecationWarning: Buffer() is deprecated due to security and usability issues. Please use the Buffer.alloc(), Buffer.allocUnsafe(), or Buffer.from() methods instead.

#code --install-extension {extension id}
code --install-extension ms-python.python
code --install-extension sirtori.indenticator
code --install-extension oderwat.indent-rainbow
code --install-extension formulahendry.vscode-mysql
code --install-extension ms-vscode.powershell
code --install-extension ms-mssql.mssql
code --install-extension tomoki1207.pdf
code --install-extension redhat.vscode-yaml
code --install-extension kddejong.vscode-cfn-lint
code --install-extension Tyriar.sort-lines
code --install-extension EditorConfig.EditorConfig
code --install-extension ziyasal.vscode-open-in-github
code --install-extension danielthielking.aws-cloudformation-yaml
code --install-extension dsteenman.cloudformation-yaml-snippets

#end vs-code config
#chrome

#end Chrome

#end Extensions

killall Finder

echo "Done!"
