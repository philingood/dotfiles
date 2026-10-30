#!/usr/bin/env bash
# Link packages into ~ with GNU Stow, for machines without nix-config.
# Where nix-config runs, home-manager links them instead (see README).
#
#   ./setup.sh               link the default packages
#   ./setup.sh tmux vim      link only these
#   ./setup.sh -D tmux       unlink (stow flags pass through)

set -euo pipefail
cd "$(dirname "$0")"

if [[ -e ~/.local/state/nix/profiles/home-manager ]]; then
  echo "This machine is managed by home-manager (nix-config), not stow." >&2
  exit 1
fi

DEFAULT=(zsh readline vim tmux bin htop)
(($#)) || set -- "${DEFAULT[@]}"
stow --verbose --restow "$@"
