# Dotfiles

Configuration files with the settings of the applications I use.

## Installation

Depending on the machine, two installation methods are used: `stow` or `home-manager`.

### Using GNU Stow

Run the setup script:

```sh
./setup.sh
```

### Using home-manager

This repository is used as a Git submodule in [nix-config](https://github.com/philingood/nix-config), where all machine configurations (NixOS, macOS) are defined. The installation is managed through Nix flakes.
