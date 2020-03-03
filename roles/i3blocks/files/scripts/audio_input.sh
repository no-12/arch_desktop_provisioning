#!/usr/bin/env bash

case $BLOCK_BUTTON in
1) i3-msg exec "pavucontrol --tab=4" >/dev/null ;;
3) amixer -q -D pulse sset Capture toggle ;;
esac

INPUT_STATE=$(amixer -D pulse get Capture | awk -F'[][]' '/\[[[:digit:]]{1,3}%\]/ { print $4; exit; }')

if [ "${INPUT_STATE}" = "off" ]; then
  echo ""
else
  echo ""
fi
