# default to save to disk, not iCloud
ok defaults NSGlobalDomain NSDocumentSaveNewDocumentsToCloud bool false

# don't prompt time machine on new disks
ok defaults com.apple.TimeMachine DoNotOfferNewDisksForBackup bool true

# --- dock
ok defaults com.apple.dock autohide bool true
ok defaults com.apple.dock static-only bool true
ok defaults com.apple.dock workspaces-swoosh-animation-off bool true
ok defaults com.apple.dashboard mcx-disabled bool true
ok defaults com.apple.dock tilesize integer 36

# remove all the things from the dock
apps=(defaults read com.apple.dock persistent-apps | grep _CFURLString\" | sed -n 's/.*Applications\/\(.*\)\/";/\1/p')

for app in $apps; do
  ok /usr/libexec/PlistBuddy -c "Delete persistent-apps:$app" ~/Library/Preferences/com.apple.dock.plist
done
killall Dock

# don't re-order spaces in mission control
ok defaults com.apple.dock mru-spaces bool false

# require password immediately on sleep or screensaver
ok defaults com.apple.screensaver askForPassword integer 1
ok defaults com.apple.screensaver askForPasswordDelay integer 0
