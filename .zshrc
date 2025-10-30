# Get ZSH startup time by calling `zprof`
zmodload zsh/zprof

# This repo's folder
DOTFILES_DIR="${0:A:h}"

# Get the Homebrew prefix (https://github.com/Homebrew/install/blob/dfeeaedef9962e643e0190747c576ef36ac111ef/install.sh#L166-L186)
if [[ "$(uname)" == "Linux" ]]; then
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ "$(uname)" == "Darwin" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  echo "Unsupported platform: $(uname)"
  exit 1
fi

# Antidote (zsh package manager: https://antidote.sh/install)
source "${HOMEBREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh"

# Configure antidote to load plugins from ./.zsh_plugins.txt and ~/.zsh_plugins.zsh
zstyle ':antidote:bundle' file "$DOTFILES_DIR/.zsh_plugins.txt"
zstyle ':antidote:static' file "${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

# Load antidote plugins from .zsh_plugins.txt
antidote load

# GitHub configuration for Transcend bash profile
export GITHUB_USERNAME=bencmbrook
export GITHUB_EMAIL=ben@transcend.io

export TRANSCEND_DIR="/Users/benbrook/transcend"

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
alias dotfiles='cd $DOTFILES_DIR'
alias site='cd $HOME/transcend/marketing-monorepo'
alias docs='cd $HOME/transcend/docs'
alias gmail='cd ~/.gmailctl && code .'

# Override vscode with cursor
alias code='cursor'

# Useful for developing this
alias sz="source ${ZDOTDIR:-$HOME}/.zshrc"

# Add `pulumi` to the PATH (https://superuser.com/questions/284342/what-are-path-and-other-environment-variables-and-how-can-i-set-or-use-them)
export PATH=$PATH:$HOME/.pulumi/bin

# Starship theme
export STARSHIP_CONFIG="$DOTFILES_DIR/starship.toml"
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

###-begin-pnpm-completion-###
if type compdef &>/dev/null; then
  _pnpm_completion () {
    local reply
    local si=$IFS

    IFS=$'\n' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" SHELL=zsh pnpm completion-server -- "${words[@]}"))
    IFS=$si

    if [ "$reply" = "__tabtab_complete_files__" ]; then
      _files
    else
      _describe 'values' reply
    fi
  }
  # When called by the Zsh completion system, this will end with
  # "loadautofunc" when initially autoloaded and "shfunc" later on, otherwise,
  # the script was "eval"-ed so use "compdef" to register it with the
  # completion system
  if [[ $zsh_eval_context == *func ]]; then
    _pnpm_completion "$@"
  else
    compdef _pnpm_completion pnpm
  fi
fi
###-end-pnpm-completion-###

