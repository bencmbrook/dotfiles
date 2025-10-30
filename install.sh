#!/bin/bash
set -e

# Install starship and antidote
brew install starship
brew install antidote

# This install script's directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "SCRIPT_DIR: $SCRIPT_DIR"

# This .zshrc file's path
ZSHRC_PATH="$SCRIPT_DIR/.zshrc"

# Source from ~/.zshrc (at top of file) if not already sourced
if ! grep -q "source $ZSHRC_PATH" "${ZDOTDIR:-$HOME}/.zshrc"; then
  echo "source $ZSHRC_PATH" | cat - "${ZDOTDIR:-$HOME}/.zshrc" > "${ZDOTDIR:-$HOME}/.zshrc.tmp" && mv "${ZDOTDIR:-$HOME}/.zshrc.tmp" "${ZDOTDIR:-$HOME}/.zshrc"
fi

echo "${ZDOTDIR:-$HOME}/.zshrc will now source $ZSHRC_PATH"