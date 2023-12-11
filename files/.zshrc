# Path to your oh-my-zsh installation. 
export ZSH=$HOME/.oh-my-zsh

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

#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export DEFAULT_USER="goncalo.sousa"
ZSH_THEME="diutsu"


# Example aliases
source ~/.zsh_alias
source ~/.zsh_alias_sensitive

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
aws
fzf
fzf-tab
docker
git
mvn
gradle
spring
#jira
zsh-syntax-highlighting
kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_fzf ] && source ~/.zsh_fzf


#[ -f /usr/local/Cellar/fzf/0.17.1/shell/key-bindings.zsh ] && /usr/local/Cellar/fzf/0.17.1/shell/key-bindings.zsh
#[ -f /usr/local/Cellar/fzf/0.17.1/shell/completion.zsh ] && /usr/local/Cellar/fzf/0.17.1/shell/completion.zsh

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

FZF_CTRL_R_OPTS='--exact'
FZF_DEFAULT_OPTS='--height 40% --border'
FZF_CTRL_T_OPTS="--preview '(cat {})'"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
if [ -f /opt/homebrew/etc/profile.d/z.sh ]; then . '/opt/homebrew/etc/profile.d/z.sh'; fi
if [ -f '${HOME}/.z.sh' ]; then . '${HOME}/.z.sh'; fi



# The next line updates PATH for the Google Cloud SDK.
#if [ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

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
source /home/diutsu/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
