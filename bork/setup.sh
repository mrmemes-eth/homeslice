# install base development software

ok brew
ok brew git
ok brew ctags
ok brew git
ok brew heroku-toolbelt
ok brew leiningen
ok brew tmux
ok brew tree

ok brew postgresql
if did_install; then
  echo "configuring postgresql to autolaunch via launchctl"
  ok symlink /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  ok launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
fi

ok brew zsh
if did_install; then
  echo "changing shell to zsh, you will need to enter your password"
  ok sudo echo /usr/local/bin/zsh >> /etc/shells
  ok chsh -s /usr/local/bin/zsh
fi

ok directory $HOME/dev
destination $HOME/dev
ok github voxdolo/homeslice

destination $HOME
for file in $HOME/dev/homeslice/dotfiles/*; do
  ok symlink "$(basename $file)" $file
done

ok directory $HOME/bin
destination $HOME/bin
for file in $HOME/dev/homeslice/bin/*; do
  ok symlink "$(basename $file)" $file
done

ok directory $HOME/dev/hashrock
destination $HOME/dev/hashrock
ok github hashrocket/hr
ok github hashrocket/dotmatrix
destination $HOME/dev/hashrock/dotmatrix
ok ./install

# set hostname
ok sudo scutil --set HostName aurum

# casks of GUI apps

ok cask alfred
ok cask caffeine
ok cask google-chrome
ok cask iterm2
ok cask rdio
ok cask slack
ok cask onepassword
ok cask dropbox
ok cask sizeup


#install RVM
ok curl -sSL https://get.rvm.io | bash -s stable --ruby

include vim.sh
include osx.sh
