## For proper developer documentation, visit https://supreme-gamers.com/gearlock
# Check `!zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns execution directory path in $BD variable
# get_net_stat
#####--- Import Functions 

GEARHOME="$GHOME"
rm -rf $GEARHOME/unins/Magisk_*
if [ "$GEARHOME" == "/data/ghome" ]; then
echo "- Systemless mode!"
fi

# recovery mode
INITRC=/android/init.rc
INITRC2=/system/etc/init/hw/init.rc

if test "$BOOTCOMP" == "yes"; then
# boot mode
INITRC=/init.rc
fi

GEARBOOT="$GEARHOME/gearboot/overlay/magisk/init"
GEAR_INITDIR="$GEARBOOT"

if [ ! -f "$INITRC" ]; then
# Android 11 new init.rc
INITRC="$INITRC2"
GEAR_INITDIR="$GEARBOOT/system/etc/init/hw"
fi

NEW_INITRC="$GEAR_INITDIR/init.rc"

rm -rf "$GEARBOOT" 2>/dev/null
rm -rf "$GEARHOME/gearboot/overlay/rusty-magisk"
echo "- Make directory: ~/gearboot/overlay/magisk/init"
mkdir -p "$GEAR_INITDIR" 2>/dev/null
echo "- Make directory: ~/.local/magisk"
rm -rf "$GEARHOME/.local/magisk" 2>/dev/null
mkdir -p "$GEARHOME/.local/magisk" 2>/dev/null

for file in magisk.rc magisk/overlay.sh magisk/loadpolicy.sh; do
sed -i "s|PLACEHOLDER_MAGISKBASE|$GEARHOME/.local/magisk|g" "$BD/$GCOMM/$file"
done

echo "- Placing neccessary files..."
touch "$GEARBOOT/init.superuser.rc"
cp -af "$BD/$GCOMM/magisk/"* "$GEARHOME/.local/magisk"

echo "- Setup init.rc overlay..."
cp "$INITRC" "$NEW_INITRC"
chmod 755 "$NEW_INITRC"
cat "$BD/$GCOMM/magisk.rc" >>"$NEW_INITRC"
chmod 750 -R "$GEARHOME/.local/magisk"
echo "- Done!"