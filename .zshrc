#############
# OH MY ZSH #
#############

# Get ZSH startup time by calling `zprof`
zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# package.json scripts autocomplete
plugins=(
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration
export GITHUB_USERNAME=bencmbrook
export GITHUB_EMAIL=ben@transcend.io

# Transend bash profile
source /Users/benbrook/transcend/main/.bash_profile

# Node Version Manager (https://github.com/nvm-sh/nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benbrook/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benbrook/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benbrook/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benbrook/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Starship theme
export STARSHIP_CONFIG=~/Code.noindex/zshrc/starship.toml
eval "$(starship init zsh)"
