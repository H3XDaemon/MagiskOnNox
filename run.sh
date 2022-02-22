#!/system/bin/sh
# run command on Termux
MODPATH="${0%/*}"
cat <<EOF >/data/data/com.termux/files/usr/bin/m 2>/dev/null
#!/system/bin/sh
/data/data/com.termux/magisk/menu option "\$@"
EOF 
chmod 777 "$MODPATH/libbusybox.so"
chmod 777 "$MODPATH/libbash.so"
exec "$MODPATH/libbash.so"
