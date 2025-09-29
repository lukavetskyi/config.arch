#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout='󰗽 Logout'

yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ~/.config/rofi/powermenu.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$logout\n$lock" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ $1 == '--shutdown' ]]; then
    systemctl poweroff
  elif [[ $1 == '--reboot' ]]; then
    systemctl reboot
  elif [[ $1 == '--lock' ]]; then
    xsecurelock
  elif [[ $1 == '--logout' ]]; then
    if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
      openbox --exit
    elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
      bspc quit
    elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
      i3-msg exit
    elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
      qdbus org.kde.ksmserver /KSMServer logout 0 0 0
    fi
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		run_cmd --lock
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
