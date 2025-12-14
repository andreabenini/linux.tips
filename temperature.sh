#!/usr/bin/env bash
#
# Get CPU temperature
#
CPU=`cat /sys/class/thermal/thermal_zone0/temp`
echo "`date '+%F %H:%M:%S'`  -  $((CPU/1000)) C" >> /root/temp.measure.log
