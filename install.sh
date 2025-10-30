#!/bin/bash
set -e

# Install homebrew if not already installed
if ! command -v brew &> /dev/null; then
  # Get the Homebrew prefix (https://github.com/Homebrew/install/blob/dfeeaedef9962e643e0190747c576ef36ac111ef/install.sh#L166-L186)
  if [[ "$(uname)" == "Linux" ]]; then
    HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  elif [[ "$(uname)" == "Darwin" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    echo "Unsupported platform: $(uname)"
    exit 1
  fi

  # Install homebrew
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add homebrew to the PATH
  echo >> ${ZDOTDIR:-$HOME}/.zshrc
  echo "eval \"\$(${HOMEBREW_PREFIX}/bin/brew shellenv)\"" >> ${ZDOTDIR:-$HOME}/.zshrc
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
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

echo "Done! ${ZDOTDIR:-$HOME}/.zshrc has been updated to source $ZSHRC_PATH"