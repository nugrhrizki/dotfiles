# ------------------- INITIALIZE

# redefine user directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# redefine system directories
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# ------------------- XDG DIRS

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSHISTFILE=-
export CM_DIR="$XDG_CACHE_HOME"/clipmenu

# ------------------- CUSTOM PATH

export APPIMGPATH="$HOME"/.local/appimg
export USRSCRIPT="$HOME"/.local/exe

# registered path
export PATH="$USRSCRIPT:$PATH"

# ------------------- PREFFERED SOFTWARE

export BROWSER=/usr/bin/chromium
export BROWSERCLI=/usr/bin/w3m
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export DOXPREV=/usr/bin/zathura
export PIXPREV=/usr/bin/sxiv

# ------------------- SOFTWARE CONFIGURATION

# fzf default opts
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200' --reverse --height=20 --algo=v1"

# manpages manpages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Java applications which use the XToolkit/XAWT backend may draw grey windows
# only. The XToolkit/XAWT backend breaks ICCCM-compliance in recent JDK 1.5  and
# early  JDK  1.6 versions,  because  it assumes a reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# nix
if [ -e /home/wright/.nix-profile/etc/profile.d/nix.sh ]; then . /home/wright/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
