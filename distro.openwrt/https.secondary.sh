#!/bin/sh /etc/rc.common
#
# Standalone uhttpd service startup script
#
START=60
USE_PROCD=1

# Environment variables
WORK_DIR=/etc/fakehttps

restart() {
    stop_service
    start_service
}

start_service() {
    # -f # keep it in foreground
    /usr/sbin/uhttpd -h $WORK_DIR/www -x $WORK_DIR -A 1 -n 1 -N 1 -R -p 127.0.0.1:7777
    exit 0
}

stop_service() {
    PID="`ps w |grep [h]ttp|grep [f]akehttps/www|awk '{print $1}'`"
    if [ "$PID" != "" ]; then
        kill -9 $PID 2>/dev/null
    fi
    exit 0
}

reload_service() {
    echo ''
}
                                                                                                                       
boot() {
    start
}
