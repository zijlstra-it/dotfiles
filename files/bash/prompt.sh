# ~/git/dotfiles/bash/prompt.sh
#
# - PROMPT_COMMAND for Terminal titles.
# - Incorporate Git information.
# - Use fancy colors based on active user and local or remote host.
#

# Colors
BLUE="\[\033[0;34m\]"
NO_COLOR="\[\e[0m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
WHITE="\[\033[1;37m\]"
YELLOW_BOLD="\[\033[1;33m\]"
PURPLE_BOLD="\[\033[1;35m\]"

# PROMPT Command 
export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME}\007';$PROMPT_COMMAND"

# Source git prompt script
if [ -f ~/bin/git-prompt.sh ]; then
  source ~/bin/git-prompt.sh
  GIT_PS1_SHOWUPSTREAM="verbose git legacy"
  GIT_PS1_SHOWDIRTYSTATE=""
  GIT_PS1_DESCRIBE_STYLE="branch"
  GIT_PS1_SHOWUNTRACKEDFILES="true"
  export GIT_PS1_SHOWUPSTREAM GIT_PS1_SHOWDIRTYSTATE GIT_PS1_DESCRIBE_STYLE GIT_PS1_SHOWUNTRACKEDFILES
  export PS1='\[\033[1;33m\]$(__git_ps1 "(%s)")\[\033[1;37m\][\[\033[1;35m\]\u@\h\[\033[1;37m\] \W]\$ '
else
  export PS1="[${PURPLE_BOLD}\u@\h${NO_COLOR}]:\W$ "
fi
