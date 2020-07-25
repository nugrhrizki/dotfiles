#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load profiles from .config/profile.d
if test -d ~/.config/profile.d/; then
    for profile in ~/.config/profile.d/*; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi
