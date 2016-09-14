source ~/.bash_aliases

# special options for OS X
if [[ $(uname -a | grep Darwin) ]]; then
  source ~/.bashrc

  # colors in terminal
  export CLICOLOR=1

  # solarized-esque colors
  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi

# RVM adds this
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
