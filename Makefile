# ~/dotfiles/Makefile

# List out all dotfiles except .git so that we can iteratively copy them.
DOTFILES != find . -maxdepth 1 -name '.[^.]*' ! -name '.git'
# Hardcoded home in case some config mngt tool is installing.
MY_HOME='/home/sanderz'

install:
    @for file in ${DOTFILES} ; do \
        cp -pPR $$file ${RT_HOME} ; \
    done

# Some programs will complain or not work until certain directories or
# permissions are present/set.
    @chmod 700 ${MY_HOME}/.gnupg

# Copy bin directory
    @cp -r bin ${MY_HOME}

clean:
    @for file in ${DOTFILES} ; do \
        rm -rf ${MY_HOME}/$$file ; \
    done

.PHONY: install clean