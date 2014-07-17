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
ok cask appcleaner
ok cask caffeine
ok cask daisydisk
ok cask dropbox
ok cask google-chrome
ok cask istumbler
ok cask iterm2
ok cask mailplane
ok cask onepassword
ok cask plex-home-theater
ok cask rdio
ok cask silverlight
ok cask skype
ok cask slack
ok cask steam
ok cask torbrowser

ok cask sizeup
if did_install; then
  defaults write com.irradiatedsoftware.SizeUp ShowOverlay -int 0
fi
