# ~/git/dotfiles/bash/base.sh
#

# history settings
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=10000
export HISTSIZE=10000

# Try to load homebrew's config.
# Then try to load Linux config.
# Load the vendored script otherwise.
if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
	for file in `ls $(brew --prefix)/etc/bash_completion.d` ; do
		. $(brew --prefix)/etc/bash_completion.d/${file}
	done
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Extend PATH with personal bin dir.
export PATH=$PATH:~/bin
