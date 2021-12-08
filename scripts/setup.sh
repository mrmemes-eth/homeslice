# install base development software

nix-env -i zsh
nix-env -i git
nix-env -i ctags
nix-env -i tree
nix-env -i coreutils
nix-env -i silver-searcher
nix-env -i emacs
nix-env -i direnv

nix-env -i tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# evaluate to see if still needed or if there are other workarounds
# ok brew reattach-to-user-namespace --wrap-pbpaste-and-pbcopy
