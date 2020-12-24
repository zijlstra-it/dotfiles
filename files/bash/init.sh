# ~/git/dotfiles/bash/init.sh
#

DOTFILES="base prompt aliases other"

for dotfile in ${DOTFILES} ; do
    if [ -f ${HOME}/.bash/${dotfile}.sh ]; then
        source ${HOME}/.bash/${dotfile}.sh
    fi
done
export BASH_SILENCE_DEPRECATION_WARNING=1

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi


# Define the PATH based on what we find
if [[ -d /usr/local/opt/terraform@0.11/bin ]]; then
    export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
fi
if [[ -d /usr/local/opt/gnu-getopt/bin ]]; then
    export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
fi
if [[ -d /usr/local/opt/grep/libexec/gnubin ]]; then
    export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
fi

# pyenv settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Let pipenv use the pyenv version activated
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
