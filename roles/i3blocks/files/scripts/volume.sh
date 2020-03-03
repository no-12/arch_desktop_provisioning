#!/usr/bin/env bash

case $BLOCK_BUTTON in
1) i3-msg exec "pavucontrol --tab=3" >/dev/null ;;
3) amixer -q -D pulse sset Master toggle ;;
4) amixer -q -D pulse sset Master 5%+ unmute ;;
5) amixer -q -D pulse sset Master 5%- unmute ;;
esac

RAW_VOLUME=$(amixer -D pulse get Master | awk -F'[][]' '/\[[[:digit:]]{1,3}%\]/ { print $2 ";" $4; exit; }')
IFS=';' read -r -a VOLUME <<<"$RAW_VOLUME"

if [ "${VOLUME[1]}" = "off" ]; then
  echo ""
else
  declare -i PERCENT=${VOLUME[0]%?}
  if ((PERCENT < 33)); then
    echo " ${VOLUME[0]}"
  elif ((PERCENT < 66)); then
    echo " ${VOLUME[0]}"
  else
    echo " ${VOLUME[0]}"
  fi
fi
