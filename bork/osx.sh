# set hostname

hostname="aurum"
currentHostName=`scutil --get HostName`
if [[ "$(scutil --get HostName)" != "aurum" ]]; then
  echo "setting HostName, you will need to enter your password"
  sudo scutil --set HostName $hostname
  if [ "$?" -eq "0" ]; then
    echo "ok: HostName set to $hostname"
  else
    echo "* failure to set HostName"
  fi
else
  echo "ok: HostName already $hostname"
fi

# default to save to disk, not iCloud
ok defaults NSGlobalDomain NSDocumentSaveNewDocumentsToCloud bool false

# don't prompt time machine on new disks
ok defaults com.apple.TimeMachine DoNotOfferNewDisksForBackup bool true

# dock
ok defaults com.apple.dock autohide bool true
ok defaults com.apple.dock static-only bool true
ok defaults com.apple.dock workspaces-swoosh-animation-off bool true
ok defaults com.apple.dashboard mcx-disabled bool true
ok defaults com.apple.dock tilesize integer 36

# don't re-order spaces in mission control
ok defaults com.apple.dock mru-spaces bool false

# require password immediately on sleep or screensaver
ok defaults com.apple.screensaver askForPassword bool true
ok defaults com.apple.screensaver askForPasswordDelay integer 0
