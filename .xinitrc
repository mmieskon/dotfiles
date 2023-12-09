#!/bin/sh

# This if statement is taken from /etc/X11/xinit/xinitrc
# and removing it could break system functionality
. /etc/X11/Xsession

xkbcomp ~/.Xkeymap "$DISPLAY"
unclutter --timeout 1 &
picom --backend glx --daemon &
xset r rate 300 50 &

exec awesome
