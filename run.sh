#!/system/bin/sh

MODPATH="${0%/*}"
chmod 777 "$MODPATH/libbusybox.so"
chmod 777 "$MODPATH/libbash.so"
exec "$MODPATH/libbash.so"