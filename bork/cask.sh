# casks of GUI apps

brew cask > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "ok: brew cask -> installing"
  brew install caskroom/cask/brew-cask
else
  echo "ok: brew cask -> updating"
  brew cask update
fi

ok cask alfred
ok cask caffeine
ok cask google-chrome
ok cask iterm2
ok cask rdio
ok cask slack
ok cask onepassword
ok cask dropbox
ok cask sizeup

