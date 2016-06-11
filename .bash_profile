function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

function promps {
  local  RED="\[\e[31m\]"
  local  GREEN="\[\e[32m\]"
  local  YELLOW="\[\e[33m\]"
  local  BLUE="\[\e[34m\]"
  local  MAGENTA="\[\e[35m\]"
  local  CYAN="\[\e[36m\]"
  local  GRAY="\[\e[37m\]"
  local  WHITE="\[\e[0m\]"
 
  case $TERM in
    xterm*) TITLEBAR='\[\e]0;\W\007\]';;
    *)      TITLEBAR="";;
  esac
    local BASE="\u@\h"
    PS1="\n${TITLEBAR}${CYAN}\w${GREEN}\$(parse_git_branch)\n${YELLOW}> ${GRAY}"
    PS2="${YELLOW}> ${GRAY}"
}
promps

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias edit='atom'                           # edit:         Opens any file in atom
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
alias DT='tee ~/Deskdtop/terminalOut.txt'   # DT:           Pipe content to file on MacOS Desktop
alias ls='ls -G'

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

