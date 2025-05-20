#!/usr/bin/env bash

if [ -z "$NIX_PATH" ]; then
    # If NIX_PATH is not set, use stow without .stowrc
    stow --ignore='.stowrc' --ignore='.DS_Store' --ignore='README.md' .
else
    # If NIX_PATH is set, use stow with settings from .stowrc
    stow .
fi
