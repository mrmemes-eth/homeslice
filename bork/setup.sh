# install base development software

# bork's ok brew isn't up for installing or really generally working properly
# without arguments. Let's do it manually!

if hash brew 2>/dev/null; then
  brew update
else
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

ok brew git
ok brew ctags
ok brew git
ok brew heroku-toolbelt
ok brew leiningen
ok brew tree

ok brew tmux
ok brew reattach-to-user-namespace --wrap-pbpaste-and-pbcopy

ok brew postgresql
if did_install; then
  echo "configuring postgresql to autolaunch via launchctl"
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
fi

ok brew zsh
if did_install; then
  echo "changing shell to zsh, you will need to enter your password"
  sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  chsh -s /usr/local/bin/zsh
fi

ok directory $HOME/dev
destination $HOME/dev
ok github voxdolo/homeslice

shopt -s dotglob
for config in $HOME/dev/homeslice/dotfiles/*; do
  ok symlink "$HOME/$(basename $config)" $config
done

ok directory $HOME/bin
for file in $HOME/dev/homeslice/bin/*; do
  ok symlink "$HOME/bin/$(basename $file)" $file
done
shopt -u dotglob

ok directory $HOME/dev/hashrock
destination $HOME/dev/hashrock
ok github hashrocket/hr
ok github hashrocket/dotmatrix
cd $HOME/dev/hashrock/dotmatrix
./bin/install

#install RVM
if hash rvm 2>/dev/null; then
  echo "ok: rvm"
else
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

include vim.sh
include osx.sh
include cask.sh
