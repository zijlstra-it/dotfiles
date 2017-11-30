# ~/git/dotfiles/bash/aliases.sh
#


alias rm='rm -i'
alias ls='ls -G'
alias ll='ls -G -l'
alias la='ls -G -la'
alias lt='ls -G -ltr'

if [ -f ~/bin/ssh-or-copy-id.sh ]; then
  alias ssh='~/bin/ssh-or-copy-id.sh'
fi