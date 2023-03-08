#!/usr/bin/env bash

case $BLOCK_BUTTON in
1) i3-msg exec "pavucontrol --tab=3" >/dev/null ;;
3) pactl set-sink-mute 0 toggle ;;
4) pactl set-sink-volume 0 +5% ;;
5) pactl set-sink-volume 0 -5% ;;
esac

MUTE=$(pactl get-sink-mute 0 | cut -d ' ' -f 2)
VOLUME=$(pactl get-sink-volume 0 | grep -Po '\d+(?=%)' | head -n 1 )

if [ "$MUTE" = "yes" ]; then
  echo "󰝟"
else
  if ((VOLUME < 33)); then
    echo "󰕿 ${VOLUME}%"
  elif ((PERCENT < 66)); then
    echo "󰖀 ${VOLUME}%"
  else
    echo "󰕾 ${VOLUME}%"
  fi
fi
