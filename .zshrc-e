# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/diutsu/.local/bin:/home/diutsu/bin:/opt/cuda/bin"
export EDITOR="vim"
export DEFAULT_USER="diutsu"
export PROGRAMS="/home/$DEFAULT_USER/programs"
export WORKSPACE="/home/$DEFAULT_USER/workspace"
export SCRIPTS="/home/$DEFAULT_USER/scripts"
export CSRGRAPHS="/home/diutsu/workspace/thesis/graphs-csr/"
export GRAPHS="/home/diutsu/workspace/thesis/graphs/"
#export JAVA_HOME="$PROGRAMS/jdk1.8.0_20"
export JAVA_OPTS="-server -da -dsa -Xms1g -Xmx4g -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=2"

#export M2_HOME="$PROGRAMS/apache-maven-3.2.5"
export MAVEN_OPTS="$JAVA_OPTS -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dmaven.compiler.useIncrementalCompilation=false"
export JPDA_TRANSPORT="dt_socket"
export JPDA_ADDRESS="8000"
export PATH=$PATH:$M2_HOME/bin:$JAVA_HOME/bin:$CATALINA_HOME/bin
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="diutsu"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

dataInfo() {
    R -q -e "x <- read.csv('$*', sep='\t', header = F); summary(x); apply(x, MARGIN = 2, FUN = sd)"
}

#alias eclipse='screen -S eclipse /home/diutsu/progs/eclipse/eclipse'
#alias eclipse-php='screen -S eclipse /home/diutsu/progs/eclipse-php/eclipse'
source ~/.zsh_alias
source ~/.zsh_alias_sensitive
source ~/.zsh_envs
source ~/.zsh_fzf
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
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_FIND_NO_DUPS="true"
HIST_IGNORE_DUPS="true"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sudo zsh-syntax-highlighting jira mvn )

source $ZSH/oh-my-zsh.sh

# User configuration

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

FZF_CTRL_R_OPTS='--exact'
