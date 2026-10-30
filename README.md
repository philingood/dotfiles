# Dotfiles

Configuration files with the settings of the applications I use.

Every top-level directory is a [GNU Stow](https://www.gnu.org/software/stow/) package that mirrors the layout of `~`, e.g. `karabiner/.config/karabiner/` ends up as `~/.config/karabiner`.

## Installation

Clone to `~/dotfiles` (the path is assumed by both methods below):

```sh
git clone https://github.com/philingood/dotfiles.git ~/dotfiles
```

### Machines with nix-config

[nix-config](https://github.com/philingood/nix-config) (home-manager) links the packages it needs straight to this clone, so edits apply without a rebuild. Nothing to run here, and `setup.sh` refuses to run on such machines.

### Machines without nix

```sh
./setup.sh             # default packages: zsh readline vim tmux bin htop
./setup.sh kitty skhd  # specific packages
./setup.sh -D kitty    # unlink
```

## Packages

| Package | Where it goes | nix-config (macOS) |
|---|---|---|
| `zsh` | `~/.zshrc`, `~/.aliases` | not used, zsh is configured in nix |
| `readline` | `~/.inputrc` | not used, configured in nix |
| `vim` | `~/.vimrc` | sourced by `programs.vim` |
| `tmux` | `~/.tmux.conf` | sourced by `programs.tmux` |
| `bin` | `~/bin` | linked |
| `karabiner` | `~/.config/karabiner` | linked (whole directory) |
| `ghostty` | `~/.config/ghostty/config` | linked |
| `hammerspoon` | `~/.hammerspoon/init.lua` | linked |
| `htop` | `~/.config/htop` | linked (whole directory) |
| `neofetch` | `~/.config/neofetch/config.conf` | linked |
| `zathura` | `~/.config/zathura/zathurarc` | linked |
| `cursor` | `~/Library/Application Support/Cursor/User/settings.json` | prepared, commented out |
| `kitty`, `neovide`, `taskell`, `skhd`, `yabai`, `firefox`, `safari` | `~/.config/…`, `~/.skhdrc`, `~/.yabairc` | not used |

Adding a config: put it under `<package>/<path relative to ~>`, then either run `./setup.sh <package>` or add a `link` line in nix-config's `modules/home-manager/default.nix`.
