#!/bin/bash

WORKING_DIR=${PWD}

DOTFILES=(bash_aliases bash_profile inputrc tmux.conf vimrc)

for i in ${DOTFILES[@]}; do
  FILE="${HOME}/.${i}"
  if [ -f "${FILE}" ]; then
    echo -n "${FILE} already exists. Overwrite it? (y/n) "
    read RESPONSE
    if [ "${RESPONSE}" == "y" ]; then
      echo "Overwriting ${FILE}"
      rm ${FILE}
      ln -s ${WORKING_DIR}/${i} ${FILE}
    else
      echo "Skipping ${FILE}"
    fi
  fi
  echo ""
done

