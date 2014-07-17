#!/usr/bin/env bash

SSHDIR=$HOME/.ssh

if [ ! -d $SSHDIR ]; then
  echo "Enter email address associated with new ssh keys:"
  read email
  ssh-keygen -t rsa -C $email

  # start the agent in the background
  ssh-add $SSHDIR/id_rsa

  echo "SSH keys generated - pubkey copied to clipboard"
  pbcopy < $SSHDIR/id_rsa.pub
  open "https://github.com/settings/ssh" -a Google\ Chrome
else
  echo "SSH already configured on this machine."
fi

