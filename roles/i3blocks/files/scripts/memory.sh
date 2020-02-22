#!/usr/bin/env bash
awk '/^MemAvailable:/ { printf(" %.1fG\n", $2/1024/1024) }' /proc/meminfo
