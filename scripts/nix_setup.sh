#!/bin/sh

# INSTALL NIX PACKAGE MANAGER
curl https://nixos.org/nix/install | sh

# ADD PACKAGE INDEX
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# INSTALL PACKAGES
nix-env -i tmux
nix-env -i git
nix-env -i tig
