#{ Bash Configuration }#

# Set our umask
umask 022

# Return if not run
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend


# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

# Disable ctrl+s and ctrl+q
stty -ixon

# enable vi mode
set -o vi

# Auto change directory if that is directory
shopt -s autocd

# Load profiles from .config/profile.d
if test -d ~/.config/profile.d/; then
    for profile in ~/.config/profile.d/*; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi
