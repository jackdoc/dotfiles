#!/bin/bash

WORKING_DIR=${PWD}

DOTFILES=(bash_aliases bash_profile inputrc tmux.conf vimrc gitignore_global git_aliases)

for i in ${DOTFILES[@]}; do
  FILE="${HOME}/.${i}"
  if [ -f "${FILE}" ]; then
    echo -n "${FILE} already exists. Overwrite it? (y/N) "
    read RESPONSE
    if [ "${RESPONSE}" == "y" ]; then
      echo "Symlinking ${FILE} to ${WORKING_DIR}/${i}"
      ln -fs ${WORKING_DIR}/${i} ${FILE}
    else
      echo "Skipping ${FILE}"
    fi
  else
    echo "Symlinking ${FILE} to ${WORKING_DIR}/${i}"
    ln -s ${WORKING_DIR}/${i} ${FILE}
  fi
  echo ""
done

set -x
git config --global core.excludesfile "~/.gitignore_global"
git config --global include.path ".git_aliases"

