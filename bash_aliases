alias ll='ls -AFlh'

# quit like vim
alias :q='exit'
alias :wq='exit'

up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

# set bash prompt
# cyan{user@host$ }
PS1="\[\e[0;36m\]\u@\h:~\$ \[\e[m\]"

