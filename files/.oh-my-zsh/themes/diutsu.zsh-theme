# vim:ft=zsh ts=2 sw=2 sts=2
# Diutsu theme for oh-my-zsh
# Based on the Sunrised - heavily modified to my preference
# (Needs Git plugin for current_branch method)

# Color shortcuts
R=$fg_no_bold[red]
RB=$fg_bold[red]
G=$fg_no_bold[green]
GB=$fg_bold[green]
M=$fg_no_bold[magenta]
MB=$fg_bold[magenta]
Y=$fg_no_bold[yellow]
YB=$fg_bold[yellow]
C=$fg_no_bold[blue]
CB=$fg_bold[blue]
K=$fg_no_bold[black]
KB=$fg_bold[black]
W=$fg_no_bold[white]
WB=$fg_bold[white]

Rb=$bg_no_bold[red]
RBb=$bg_bold[red]
Gb=$bg_no_bold[green]
GBb=$bg_bold[green]
Mb=$bg_no_bold[magenta]
MBb=$bg_bold[magenta]
Yb=$bg_no_bold[yellow]
YBb=$bg_bold[yellow]
Cb=$bg_no_bold[blue]
CBb=$bg_bold[blue]
Kb=$bg_no_bold[black]
KBb=$bg_bold[black]
Wb=$bg_no_bold[white]
WBb=$bg_bold[white]

RESET=$reset_color


local return_code="%(?..%{$r%}%? ↵%{$reset%})"

local user=`whoami`

#GRP_SEP=$'\ue0cc'
#END_SEP=$'\ue0b0'
#ERR_SEP=$'\ue0b1'
#IC_GB=$'\ue0a0'
#IC_GC=$'\ue000'
#IC_CL=$'\uf017'
#IC_FD=$'\ue5fe'
GRP_SEP=$''
END_SEP=$''
ERR_SEP=$''
IC_GB=$''
IC_GC=$''
IC_CL=$''
IC_FD=$''

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  #echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$(parse_git_dirty)$(git_prompt_behind)$(git_prompt_ahead)$(custom_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  echo "($(git_current_branch))"
}

if [ "$user" = "root" ]; then
    PREFIX="%{$R%}#! " CHAR="$";
    BTYQR="%(?.%{$RB%}$END_SEP%{$MB%}$END_SEP%{$CB%}$END_SEP.%{$RB%}>$END_SEP$END_SEP$END_SEP)%{$RESET%} "
else
    PREFIX="" CHAR=":"
    BTYQR="%(?.%{$Y$Rb%}$END_SEP%{$R$Mb%}$END_SEP%{$M$Cb%}$END_SEP%{$C$Kb%}$END_SEP%{$RESET%}.%{$Y$Rb%}$END_SEP%{$KB$Rb%}$ERR_SEP$ERR_SEP%{$R$Kb%}$END_SEP)%{$RESET%} "
fi

if [[ "$user" != "$DEFAULT_USER" ]]; then
  T_USER="%{$Y%}%n"
fi
if [[  -n "$SSH_CLIENT" ]]; then
  T_USER="%{$Y%}%n@%m "
fi

#TIME="[%D{%d/%m %H:%M:%S}]"
TIME="%{$M%}%D{%H:%M} "
FOLDER='%{$C%}%4~ '
GIT='%{$Y%}$(custom_git_prompt) '
BTYQR='%B%(?.$CHAR.%{$R%}$CHAR)%b%{$RESET%} '
#

# %B sets bold text
PROMPT="$PREFIX$T_USER%{$RESET%}%{$K%}$TIME$FOLDER$GIT$BTYQR"
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$K$Yb%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_BEHIND="%{$C%}|➔|"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$C%}➔"
ZSH_THEME_GIT_STATUS_PREFIX=""

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$G%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$G%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$G%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$G%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}U"
