# Get ZSH startup time by calling `zprof`
zmodload zsh/zprof

# This repo's folder
ZSHRC_FOLDER="$HOME/Code.noindex/zshrc"

# Antidote (zsh package manager: https://antidote.sh/install)
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Configure antidote to load plugins from ./.zsh_plugins.txt and ~/.zsh_plugins.zsh
zstyle ':antidote:bundle' file "$ZSHRC_FOLDER/.zsh_plugins.txt"
zstyle ':antidote:static' file "${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

# Load antidote plugins from .zsh_plugins.txt
antidote load

# GitHub configuration for Transcend bash profile
export GITHUB_USERNAME=bencmbrook
export GITHUB_EMAIL=ben@transcend.io

# Transend bash profile
source /Users/benbrook/transcend/main/.bash_profile

# For GPG signatures (https://stackoverflow.com/a/42265848)
export GPG_TTY=$(tty)

## Start Ben's Custom Functions
# mkdir and cd into it
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
## End Ben's Custom Functions

# Aliases
alias codes='cd $HOME/Code.noindex'
alias zshrc='cd $HOME/Code.noindex/zshrc'
alias pgpt='cd $HOME/transcend/ai-chatbot'
alias site='cd $HOME/transcend/marketing-monorepo'
alias docs='cd $HOME/transcend/docs'
alias gmail='cd ~/.gmailctl && code .'

# Override vscode with cursor
alias code='cursor'

# Useful for developing this
alias sz='source ~/.zshrc'

# Add `pulumi` to the PATH (https://superuser.com/questions/284342/what-are-path-and-other-environment-variables-and-how-can-i-set-or-use-them)
export PATH=$PATH:$HOME/.pulumi/bin

# Starship theme
export STARSHIP_CONFIG="$ZSHRC_FOLDER/starship.toml"
eval "$(starship init zsh)"

# Autoload nvm
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

