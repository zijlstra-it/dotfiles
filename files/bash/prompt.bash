# ~/git/dotfiles/bash/prompt.bash
#
# - PROMPT_COMMAND for Terminal titles.
# - Incorporate Git information.
# - Use fancy colors based on active user and local or remote host.
#

# Colors
local BLUE="\[\033[0;34m\]"
local NO_COLOR="\[\e[0m\]"
local GREEN="\[\033[0;32m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local RED="\[\033[0;31m\]"
local LIGHT_RED="\[\033[1;31m\]"
local WHITE="\[\033[1;37m\]"
local YELLOW="\[\033[0;33m\]"
local PURPLE="\[\033[1;35m\]"

# PROMPT Command 
export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME}\007';$PROMPT_COMMAND"

# Source git prompt script
if [ -f ~/bin/git-prompt.sh ]; then
  source ~/bin/git-prompt.sh
  GIT_PS1_SHOWUPSTREAM="verbose git legacy"
  GIT_PS1_SHOWDIRTYSTATE="true"
  GIT_PS1_DESCRIBE_STYLE="branch"
  GIT_PS1_SHOWUNTRACKEDFILES="true"
  export GIT_PS1_SHOWUPSTREAM GIT_PS1_SHOWDIRTYSTATE GIT_PS1_DESCRIBE_STYLE GIT_PS1_SHOWUNTRACKEDFILES
  PS1='[\[\033[01;35m\]sander@\h\[\033[00m\]]:\W\[\033[01;33m\]$(__git_ps1)\[\033[00m\]\$ '
else
  PS1='[\u@\h:\W]$ '
fi

# fancy prompt with colors 
#PS1='[\[\033[01;35m\]\u@\h:\[\033[00m\]]\w\$ '

# history settings
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=10000
export HISTSIZE=10000

# Aliases
alias rm='rm -i'
alias ls='ls -G'
alias ll='ls -G -l'
alias la='ls -G -la'
alias lt='ls -G -ltr'
if [ -f ~/TMG/bin/ssh-or-copy-id.sh ]; then
  alias ssh='~/TMG/bin/ssh-or-copy-id.sh'
fi

# PATH with my scrippies
PATH=$PATH:~/TMG/bin

export PATH

PATH="/Users/sanderz/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/sanderz/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/sanderz/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/sanderz/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/sanderz/perl5"; export PERL_MM_OPT;
