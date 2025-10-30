#!/bin/bash
set -e

# Install homebrew if not already installed
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install starship and antidote
brew install starship
brew install antidote

# This install script's directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# This .zshrc file's path
ZSHRC_PATH="$SCRIPT_DIR/.zshrc"

# Source from ~/.zshrc (at top of file) if not already sourced
if ! grep -q "source $ZSHRC_PATH" "${ZDOTDIR:-$HOME}/.zshrc"; then
  echo "source $ZSHRC_PATH" | cat - "${ZDOTDIR:-$HOME}/.zshrc" > "${ZDOTDIR:-$HOME}/.zshrc.tmp" && mv "${ZDOTDIR:-$HOME}/.zshrc.tmp" "${ZDOTDIR:-$HOME}/.zshrc"
fi

source ${ZDOTDIR:-$HOME}/.zshrc
echo "Done! ${ZDOTDIR:-$HOME}/.zshrc has been updated to source $ZSHRC_PATH"