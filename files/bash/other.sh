# ~/git/dotfiles/bash/other.sh
#

# Python
unset PYTHONPATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# MOTD
if [ -f $HOME/bin/motd ]; then $HOME/bin/motd; fi
