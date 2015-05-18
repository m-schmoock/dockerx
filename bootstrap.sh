#!/sbin/env sh

xauth add $DISPLAY . $XCOOKIE
unset XCOOKIE
vblank_mode=0 glxgears

