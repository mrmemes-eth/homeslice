# casks of GUI apps

brew cask > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "ok: brew cask -> installing"
  brew install caskroom/cask/brew-cask
else
  echo "ok: brew cask -> updating"
  brew cask update
fi

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

ok cask alfred
if did_install; then
  # remove spotlight keybindings
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = (65535, 49, 1048576); type = standard; }; }"
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{ enabled = 0; value = { parameters = (65535, 49, 1572864); type = standard; }; }"
  # add alfred keybinding
  defaults write com.runningwithcrayons.Alfred-Preferences hotkey.default -dict key -int 49 mod -int 1048576 string Space
fi
ok defaults com.runningwithcrayons.Alfred-Preferences appearance.theme alfred.theme.dark

ok cask sizeup
if did_install; then
  # enable accessibility for sizeup
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.SizeUp',0,1,1,NULL);"
fi
ok defaults com.irradiatedsoftware.SizeUp ShowOverlay integer 0
ok defaults com.irradiatedsoftware.SizeUp StartAtLogin bool true
