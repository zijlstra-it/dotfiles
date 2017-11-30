# ~/git/dotfiles/bash/base.sh
#

# history settings
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=10000
export HISTSIZE=10000

# Try to load homebrew's config.
# Then try to load Linux config.
# Load the vendored script otherwise.
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

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
