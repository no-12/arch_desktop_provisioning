#!/usr/bin/env bash
readarray -d ' ' -t loadavg </proc/loadavg
echo " ${loadavg[0]}"
