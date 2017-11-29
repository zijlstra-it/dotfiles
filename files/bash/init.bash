export SHELL_NAME="bash"

DOTFILES="prompt aliases tmux other"

for dotfile in ${DOTFILES}; do
    if [ -f ${file} ]; do
        source $HOME/.bash/${filer}.sh
    fi
done