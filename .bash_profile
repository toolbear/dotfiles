# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$HOME/bin:/usr/local/mysql/bin:/usr/local/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export JAVA_OPTS="-Dfile.encoding=UTF-8"

#-----------------------------------------------------------------------------

stty erase 
export EDITOR=emacsclient

export LESS="\
    --hilite-unread \
    --no-init \
    --no-lessopen \
    --QUIT-AT-EOF \
    --quit-if-one-screen \
    --quit-on-intr \
    --RAW-CONTROL-CHARS \
    --tabs=4 \
"
export HISTCONTROL=erasedups
export HISTFILE=$HOME/.history
export HISTFILESIZE=50000

. ~/.nvm/nvm.sh
. ~/.svm/svm.sh
