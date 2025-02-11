#!/bin/bash
### ---------------- Symlink dotfiles into home directory ----------------- ###
# Designed for use with Strap: https://github.com/MikeMcQuaid/strap
# Run by strap-after-setup
symlink_dotfiles() {
  if [ -d ~/.dotfiles ]; then
    (
      echo "-> Dotfiles found. Symlinking dotfiles into home directory."
      # Make directories for symlinks, if they don't already exist
      mkdir -p ~/{.gnupg,.ssh}
      # Create symlinks (ln -s), and don't prompt (-i) before overwrite (-f)
      # TODO: read ~/.dotfiles and iterate over, instead of hardcoding paths
      ln -s -f ~/.dotfiles/.gitconfig ~/.gitconfig
      ln -s -f ~/.dotfiles/.gitmessage ~/.gitmessage
      ln -s -f ~/.dotfiles/.hyper.js ~/.hyper.js
      ln -s -f ~/.dotfiles/.zshrc ~/.zshrc
      ln -s -f ~/.dotfiles/.gnupg/gpg.conf ~/.gnupg/gpg.conf
      ln -s -f ~/.dotfiles/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
      ln -s -f ~/.dotfiles/.ssh/config ~/.ssh/config
    )
  else
    echo "-> Error: Dotfiles directory not found. Symlinking not successful."
  fi
}
if symlink_dotfiles; then
  echo "-> symlink_dotfiles() ran successfully."
else
  echo "-> symlink_dotfiles() did not run successfully."
fi

set_perms() {
  # Set permissions for GPG
  chmod 700 ~/.gnupg
  chmod 600 ~/.gnupg/gpg.conf
}
if set_perms; then
  echo "-> set_perms() ran successfully."
else
  echo "-> set_perms() did not run successfully."
fi
