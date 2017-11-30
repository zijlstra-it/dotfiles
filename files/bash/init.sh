# ~/git/dotfiles/bash/init.sh
#

DOTFILES="base prompt aliases other"

for dotfile in ${DOTFILES} ; do
    if [ -f ${HOME}/.bash/${dotfile} ]; then
        source ${HOME}/.bash/${dotfile}.sh
    fi
done