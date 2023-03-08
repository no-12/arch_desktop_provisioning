#!/usr/bin/env bash

case $BLOCK_BUTTON in
1) i3-msg exec "pavucontrol --tab=4" >/dev/null ;;
3) pactl set-source-mute 0 toggle ;;
esac

INPUT_STATE=$(pactl get-source-mute 0 | cut -d ' ' -f 2)

if [ "${INPUT_STATE}" = "yes" ]; then
  echo "󰍭"
else
  echo "󰍬"
fi
