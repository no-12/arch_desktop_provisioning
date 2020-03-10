#!/usr/bin/env bash

acpi_output=$(acpi -ab)

case $BLOCK_BUTTON in
1) notify-send -a "acpi" "Battery" "$acpi_output" ;;
esac

declare -a battery
mapfile -t battery < <(awk -F'[, %]' '/Battery 0/ { print $3; print $5; }' <<<"$acpi_output")

if [ ${#battery[@]} -eq 0 ]; then
  exit
fi

plugged_in=""
if [ "${battery[0]}" = Charging ] || grep -q 'on-line' <<<"$acpi_output"; then
  plugged_in=
fi

battery_level=
if ((battery[1] < 20)); then
  battery_level=
elif ((battery[1] < 40)); then
  battery_level=
elif ((battery[1] < 60)); then
  battery_level=
elif ((battery[1] < 80)); then
  battery_level=
fi

printf "%s  %s%% %s\n" $battery_level "${battery[1]}" $plugged_in
