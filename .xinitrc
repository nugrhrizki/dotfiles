#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11

# while true; do
#    xsetroot -name "$( date +"%F %R" )"
#    sleep 1m    # Update time every minute
# done &

mpd & # music player daemon
 xwallpaper --zoom ~/.local/share/backgrounds/09_wallpaper.jpg & # wallpaper

# exec dwm
# exec gnome-session
# exec startlxde
exec xmonad
