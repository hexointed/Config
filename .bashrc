export PATH="$HOME/bin:$HOME/.rvm/bin:/home/elias/.local/bin:/opt/ghc/bin:/opt/cabal/1.24/bin:$HOME/.cabal/bin:$PATH:~/Xilinx/Vivado/2016.4/bin:~/Qt5.10.1/Tools/QtCreator/bin:~/bin"

#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:~/Qt5.10.1/5.10.1/gcc_64/lib"
source "/home/elias/.wd"

export EDITOR=vim
export VISUAL=$EDITOR

setxkbmap -option caps:escape
xsetroot -solid grey

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='${PWD#"${PWD%/*/*}/"} > '

export TERM='xterm-256color'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias ghci='ghci -fno-warn-tabs'
alias ghc='ghc -fno-warn-tabs'
alias web='xdg-open ~/test.html > /dev/null 2> /dev/null'
alias clashi='clash --interactive -fno-warn-tabs'
alias clash='clash -fno-warn-tabs'
alias :q='exit'
alias :r='fc -e : -1'
alias open="xdg-open 2> /dev/null"
alias vim="vim -c \":tab ball\""
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT1| grep --color=none -E "state|time\ to|percentage"'
alias brightness='xrandr --output eDP-1 --brightness'
alias t='konsole'
alias findall='find . -print0 | grep -zvE "pristine|tags|Makefile" | xargs -0 grep -s'
alias finda='find . -print0 | grep -zvE "pristine|tags|target|Makefile" | xargs -0 grep -s'
alias finds='git ls-files -z | grep -zv tags | grep -zv branches | xargs -0 grep -s'
alias findb='git ls-files -z | grep -zv tags | xargs -0 grep -s'
alias svnclean="svn status --no-ignore | grep '^[I?]' | cut -c 9- | while IFS= read -r f; do rm -rf \"$f\"; done"
alias b='cde build install -T 4 2>&1 | sed "s/\(.*Unpacking\) [^[:space:]]*\/\([^[:space:]]*\).*/\1 \2/" | grep -E "ERROR|BUILD FAILURE|BUILD SUCCESS|Fault:|Total time:|Finished at:|error:|warning:|note:|undefined|Unpacking|make: \*\*\*|Error:|RCC: Error|Cannot find file:|WARNING:"'
alias bb=b
alias =b
alias B=b
