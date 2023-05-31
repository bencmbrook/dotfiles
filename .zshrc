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
# Yarn scripts autocomplete
antigen bundle yarn

# NVM with lazy loading (it's slow to start terminal)
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Apply antigen
antigen apply

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
alias code='open -b com.microsoft.VSCode "$@"'
alias codes='cd $HOME/Code.noindex'
alias website='cd $HOME/transcend/website'
alias gmail='cd ~/.gmailctl && code .'
alias docs='cd $HOME/transcend/website-2.0'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Add `pulumi` to the PATH (https://superuser.com/questions/284342/what-are-path-and-other-environment-variables-and-how-can-i-set-or-use-them)
export PATH=$PATH:$HOME/.pulumi/bin

# Starship theme
export STARSHIP_CONFIG="$ZSHRC_FOLDER/starship.toml"
eval "$(starship init zsh)"
