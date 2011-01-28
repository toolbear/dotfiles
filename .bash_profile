# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$HOME/bin:/opt/jruby/bin:/opt/scala/bin:/opt/node/bin:/usr/local/mysql/bin:/opt/groovy/bin:/opt/flex_sdk/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export PYTHONPATH=$HOME/lib/python:$PYTHONPATH
export JAVA_OPTS="-Dfile.encoding=utf8"

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
"
export HISTCONTROL=erasedups
export HISTFILE=$HOME/.history
export HISTFILESIZE=50000
