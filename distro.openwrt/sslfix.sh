#!/bin/sh /etc/rc.common
#
# SSL Patch fix for saving router's storage space
#     This dirty hack might save precious MBs just using some RAM disk
#     instead saving data on /overlay (overlayfs, eeprom). gunzip gave me ~1Mb free
#
START=13
USE_PROCD=1
DIR_TMP=/tmp/usr/lib
DIR_STORAGE=/overlay/upper/usr/lib

restart() {
    stop_service
    start_service
}

start_service() {
    mkdir  -p  $DIR_TMP
    gunzip -kc $DIR_STORAGE/libssl.so.1.1.gz     > $DIR_TMP/libssl.so.1.1
    gunzip -kc $DIR_STORAGE/libcrypto.so.1.1.gz  > $DIR_TMP/libcrypto.so.1.1
}

stop_service() {
    echo ''
}

reload_service() {
    rm -f $DIR_STORAGE/libcrypto.so.1.1
    rm -f $DIR_STORAGE/libssl.so.1.1
    ln -s $DIR_TMP/libcrypto.so.1.1   $DIR_STORAGE/libcrypto.so.1.1
    ln -s $DIR_TMP/libssl.so.1.1      $DIR_STORAGE/libssl.so.1.1
}

boot() {
    start
}
