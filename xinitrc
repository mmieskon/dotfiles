#!/bin/sh

# This if statement is taken from /etc/X11/xinit/xinitrc
# and removing it could break system functionality
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xkbcomp ~/.Xkeymap "$DISPLAY"
unclutter --timeout 1 &
picom --backend glx --daemon &
xset r rate 300 50 &

exec awesome
