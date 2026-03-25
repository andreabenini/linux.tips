#!/usr/bin/env sh
#
# Getting system temperatures
#

# getting all temps from virtual fs thermal_zone
data=$(paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp))

# Process it with awk
# acpitz*        - MoBo temps
# x86_pkg_temp   - x86 CPU temps (to be refined for ARM, MIPS or others)
STATUS=$(echo "$data" | awk '
{
    temp = $2 / 1000
    if ($1 == "x86_pkg_temp") {
        cpu = temp "C"
    } else if ($1 == "acpitz") {
        mb = (mb == "" ? "" : mb ", ") temp "C"
    }
}
END {
    printf "CPU [%s]  Motherboard [%s]", cpu, mb
}')

# Simple echo from console, store last logs when executed from crontab
if [ -t 0 ]; then
    echo "$STATUS"
else
    # From crontab, no interactive shell
    echo "`date '+%F %H:%M:%S'`  -  $STATUS" >> /tmp/temperature.log
    tail -n 200 /tmp/temperature.log > /tmp/temperture.log.tmp && mv /tmp/temperature.log.tmp /tmp/temperature.log
fi
