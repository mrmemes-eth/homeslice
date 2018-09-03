ok apt git
ok apt exuberant-ctags
ok apt leiningen
ok apt tree
ok apt silversearcher-ag
ok apt vim
ok apt emacs

ok apt tmux
ok apt postgresql

if did_install; then
  echo "configuring postgresql to autolaunch via launchctl"
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homeapt.mxcl.postgresql.plist
fi

ok apt zsh
if did_install; then
  echo "changing shell to zsh, you will need to enter your password"
  sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  chsh -s /usr/local/bin/zsh
fi

ok directory $HOME/dev
cd $HOME/dev
ok github voxdolo/homeslice

shopt -s dotglob
for config in $HOME/dev/homeslice/dotfiles/*; do
  ok symlink "$HOME/$(basename $config)" $config
done
shopt -u dotglob

echo "To Install otherwise:"
echo " * git-fixup (https://github.com/keis/git-fixup)"
echo " * heroku-cli (sudo snap install --classic heroku)"
echo " * tmux plugins (git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm)"
