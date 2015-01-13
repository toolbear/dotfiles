[ -f ~/.alias ] && source ~/.alias

[ -x dircolors ] && eval `dircolors $HOME/.dircolors`

if [ "$PS1" != "" ] ; then      # Interactive shells only
    case "$TERM" in
        xterm*|vt100|screen|ansi)
            export PS1="\033]0;\u@$(hostname)\007\[\033[44;37m\]\$($HOME/.shortpwd 60)\[\033[0m\]\$(parse_git_branch)\n\$ "
            ;;
        *)
            export PS1="\u@$(hostname):\$($HOME/.shortpwd)\$(parse_git_branch)\n\$ "
            ;;
    esac
fi
