# Get ZSH startup time by calling `zprof`
zmodload zsh/zprof

# This repo's folder
ZSHRC_FOLDER="$HOME/Code.noindex/zshrc"

# Antigen (zsh package manager: https://github.com/zsh-users/antigen)
source "$ZSHRC_FOLDER/antigen.zsh"

# oh-my-zsh
antigen use oh-my-zsh

###################
# ANTIGEN PLUGINS #
###################

antigen bundle yarn
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Apply antigen
antigen apply

# GitHub configuration for Transcend bash profile
export GITHUB_USERNAME=bencmbrook
export GITHUB_EMAIL=ben@transcend.io

# Transend bash profile
# source /Users/benbrook/transcend/main/.bash_profile

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
alias code='open -b com.microsoft.VSCode "$@"'
alias codes='cd $HOME/Code.noindex'
alias pgpt='cd $HOME/Code.noindex/privacy-gpt'
alias website='cd $HOME/transcend/website'
alias docs='cd $HOME/transcend/website-2.0'
alias gmail='cd ~/.gmailctl && code .'

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

# pnpm autocomplete, installed via `pnpm install-completion zsh`
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
