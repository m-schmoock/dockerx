#!/sbin/env sh

xauth add $DISPLAY . $XCOOKIE
unset XCOOKIE
glxgears

