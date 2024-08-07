# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k"
source  ~/.dotfiles/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.dotfiles/.profile
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  aws
  colored-man-pages
  cp
  dirhistory
  docker
  fancy-ctrl-z
  gh
  git
  git-escape-magic
  git-extras
  golang
  helm
  mvn
  pipenv
  virtualenv
  poetry
  pyenv
  rust
  sudo
)

# User configuration

SHARE_HISTORY="true"

# Manually installed plugins

source ~/.dotfiles/zsh-plugins/zsh-bat/zsh-bat.plugin.zsh

source ~/.dotfiles/zsh-plugins/you-should-use/zsh-you-should-use.plugin.zsh

# Kubectl completions

source ~/.dotfiles/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.dotfiles/zsh-plugins/fzf-tab/fzf-tab.plugin.zsh

source ~/.dotfiles/zsh-plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh

source ~/.dotfiles/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.dotfiles/zsh-plugins/forgit/forgit.plugin.zsh

fpath=(/usr/share/zsh/vendor-completions $fpath)

fpath=(~/.dotfiles/zsh-plugins/zsh-completions/src $fpath)

fpath=(~/.dotfiles/zsh-plugins/forgit/completions $fpath)

fpath=(~/.dotfiles/zsh-plugins/custom-completions $fpath)

fpath=(~/.zfunc $fpath)

# Allow completing of sbin entries for sudo
zstyle ':completion:*:sudo::' environ PATH="/sbin:/usr/sbin:$PATH"

export PATH="$HOME/.dotfiles/zsh-plugins/forgit/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Powerlevel10k customization

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ZSH's glob matching messes with setting list-options in helm
# e.g. --set ingress.hosts[0]=flerb.bar
setopt +o nomatch

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

if [ -f "$HOME/.dotfiles/asdf/completions/asdf.bash" ]; then
  source "$HOME/.dotfiles/asdf/completions/asdf.bash"
fi

if [ -f "$HOME/.asdf/plugins/java/set-java-home.zsh" ]; then
  source "$HOME/.asdf/plugins/java/set-java-home.zsh"
fi

alias kubectl-show-ns='kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n'

# Funny fun:
alias fucking='sudo '

# Lazygit client
if command -v lazygit 1> /dev/null 2>&1; then
  alias gk='lazygit'
fi

# better ls
if command -v exa 1>/dev/null 2>&1; then
  alias ls='exa'
  alias lsa='exa -la --git'
else
  alias lsa='ls -lah'
fi

# better cat
if command -v bat 1>/dev/null 2>&1; then
  alias cat='bat'
fi

# the fuck
if command -v thefuck 1>/dev/null 2>&1; then
  eval $(thefuck --alias)
fi

alias :q='exit'
alias :wq='exit'

if command -v pipenv 1>/dev/null 2>&1; then
  eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
fi

if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v nvim 1>/dev/null 2>&1; then
  alias vim='nvim'
fi

if command -v aws 1>/dev/null 2>&1; then
  export AWS_CLI_AUTO_PROMPT=on-partial
fi

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

if [ -d "$HOME/.vim/plugged/fzf/bin" ]; then
  export PATH="$HOME/.vim/plugged/fzf/bin:$PATH"
fi

if [ -f "$HOME/.fzf.zsh" ]; then
  source ~/.fzf.zsh
fi

if command -v atuin 1>/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi
