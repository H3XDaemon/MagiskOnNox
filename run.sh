#!/system/bin/sh

MODPATH="${0%/*}"
unset LD_PRELOAD
export PATH="/sbin:/system/bin:/system/xbin:$MODPATH"
chmod 777 "$MODPATH/libbusybox.so"
chmod 777 "$MODPATH/libbash.so"
exec "$MODPATH/libbash.so"
