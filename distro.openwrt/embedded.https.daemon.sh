#!/bin/sh /etc/rc.common
#
# Embedded https daemon startup script
#
START=60
EXTRA_COMMANDS='status'
EXTRA_HELP='        status          Daemon status'

# Environment variables
WORK_DIR=/etc/fakehttps

restart() {
    stop_service
    start_service
}

start() {
    # -f # keep it in foreground
    /usr/sbin/uhttpd -h $WORK_DIR/www -x $WORK_DIR -A 1 -n 1 -N 1 -R -p 127.0.0.1:7777
    exit 0
}

stop() {
    PID="`ps w |grep [h]ttp|grep [f]akehttps/www|awk '{print $1}'`"
    if [ "$PID" != "" ]; then
        kill -9 $PID 2>/dev/null
    fi
    exit 0
}

status() {
    PID="`ps w |grep [h]ttp|grep [f]akehttps/www|awk '{print $1}'`"
    if [ "$PID" != "" ]; then
        echo 'Daemon is running'
    else
        echo 'Daemon is not running'
    fi
}

reload() {
    echo ''
}

boot() {
    start
}
