# ~/git/dotfiles/bash/init.sh
#

DOTFILES="base prompt aliases other"
 
for dotfile in ${DOTFILES} ; do
    if [ -f ${HOME}/.bash/${dotfile}.sh ]; then
        source ${HOME}/.bash/${dotfile}.sh
    fi
done
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1
