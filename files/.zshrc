# Path to your oh-my-zsh installation. 

export ZSH=$HOME/.oh-my-zsh

export PATH="$PATH:$(brew --prefix python)/libexec/bin"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
export PATH="$PATH:/usr/sbin:/sbin"
export PATH="$PATH:/usr/local/games:/usr/games:$HOME/.local/bin:$HOME/bin"

export GPG_TTY=`tty`

export EDITOR="vim"
export WORKSPACE="$HOME/workspace"
export DOTFILES="$HOME/.dotfiles"


# Use login keychain for aws-vault
export AWS_VAULT_KEYCHAIN_NAME="login"
# Use long living sessions in aws-vault
export AWS_SESSION_TTL="12h"
#export CSRGRAPHS="$HOME/workspace/thesis/graphs-csr/"
#export GRAPHS="$HOME/workspace/thesis/graphs/"
#export JAVA_HOME="$PROGRAMS/jdk1.8.0_20"
#export JAVA_OPTS="-server -da -dsa -Xms1g -Xmx4g -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=2"

#export M2_HOME="$PROGRAMS/apache-maven-3.2.5"
#export MAVEN_OPTS="$JAVA_OPTS -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dmaven.compiler.useIncrementalCompilation=false"
#export JPDA_TRANSPORT="dt_socket"
#export JPDA_ADDRESS="8000"
#export PATH=$PATH:$M2_HOME/bin:$JAVA_HOME/bin

export PATH=$PATH:$HOME/aws/scripts
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export DEFAULT_USER="goncalo.sousa"
# custom oh-my-zsh teheme
# ZSH_THEME="diutsu"

# export FZF_BASE="/opt/Homebrew/opt/fzf"

# Load  aliases
source ~/.zsh_alias # under VCS
source ~/.zsh_alias_sensitive # local-only

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories # much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
hist_ignore_dups="true"
HIST_FIND_NO_DUPS="true"
HIST_IGNORE_DUPS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export FZF_CTRL_R_OPTS='--exact'
export FZF_DEFAULT_OPTS='--height 40% --border "bold" --prompt=" " --marker="" --pointer=""'
export FZF_CTRL_T_OPTS="--preview '(cat {})'"
 

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    fzf-tab
    zsh-autosuggestions
    fzf
    aws
    docker
    git
    mvn
    gradle
    spring
    zsh-syntax-highlighting
    kubectl
)

#fzf-tab
#
## disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

source $ZSH/oh-my-zsh.sh
# source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# if [ -f '${HOME}/.z.sh' ]; then . '${HOME}/.z.sh'; fi
source <(fzf --zsh)
[ -f ~/.zsh_fzf ] && source ~/.zsh_fzf



test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/goncalo.sousa/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

eval "$(oh-my-posh init zsh --config ~/.diutsu.omp.toml)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
