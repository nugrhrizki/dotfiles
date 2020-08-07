#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

mpd & # music player daemon
xwallpaper --zoom ~/.local/share/backgrounds/09_wallpaper.jpg & # wallpaper

exec dwm
