#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

if [ -f $HOME/.config/.Xresources ]; then
	xrdb -merge $HOME/.config/.Xresources
fi

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

nvidiapower
clean
numlockx &
dwmblocks &
nvidia-settings -l ~/.config/nvidia/settings/.nvidia-settings-rc &
exec dunst -conf ~/.config/dunst/dunstrc &
exec picom -b --config ~/.config/picom.conf &
exec nitrogen --restore &
exec playerctld daemon &
exec dwm
