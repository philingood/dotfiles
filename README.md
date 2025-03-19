# Dotfiles

Depending on the machine, two installation methods are used: `stow` or `home-manager`.

## Installation

### Using GNU Stow

Run the setup script:

```sh
./setup.sh
```

### Using home-manager

This repository is used as a Git submodule in my [nix-config](https://github.com/philingood/nix-config), where all machine configurations (NixOS, macOS) are defined. The installation is managed through Nix flakes.
