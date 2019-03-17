# install base development software

# bork's ok brew isn't up for installing or really generally working properly
# without arguments. Let's do it manually!

ok brew git
ok brew git-fixup
ok brew ctags
ok brew heroku/brew/heroku
ok brew leiningen

if did_install; then
  brew cask install java
end

ok brew clojure
ok brew tree
ok brew coreutils
ok brew proctools
ok brew ag

ok brew tmux
ok brew reattach-to-user-namespace --wrap-pbpaste-and-pbcopy

ok brew emacs

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

ok directory $HOME/src
destination $HOME/src
ok github voxdolo/homeslice

shopt -s dotglob
for config in $HOME/src/homeslice/dotfiles/*; do
  ok symlink "$HOME/$(basename $config)" $config
done

shopt -u dotglob

ok github tmux-plugins/tpm $HOME/.tmux/plugins/tpm

include vim.sh
include osx.sh

echo $HOME/dev/homeslice/ssh_config.sh|pbcopy

echo "<======================================================================>"
echo " NEXT STEPS"
echo " 1. authenticate 1password"
echo " 2. authenticate chrome"
echo " 3. configure SSH (command copied to clipboard)"
echo "<======================================================================>"
