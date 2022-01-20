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
GEARBOOT="$GEARHOME/gearboot/overlay/rusty-magisk/init"

rm -rf "$GEARBOOT" 2>/dev/null
echo "- Make directory: ~/gearboot/overlay/rusty-magisk/init"
mkdir -p "$GEARBOOT" 2>/dev/null
echo "- Make directory: ~/.local/magisk"
rm -rf "$GEARHOME/.local/magisk" 2>/dev/null
mkdir -p "$GEARHOME/.local/magisk" 2>/dev/null

for file in magisk.rc magisk/overlay.sh magisk/loadpolicy.sh; do
sed -i "s|PLACEHOLDER_MAGISKBASE|$GEARHOME/.local/magisk|g" "$BD/$GCOMM/$file"
done

echo "- Placing neccessary files..."
cp -af "$BD/$GCOMM/magisk/"* "$GEARHOME/.local/magisk"
cp -f "$BD/$GCOMM/magisk.rc" "$GEARBOOT/init.superuser.rc"
chmod 750 -R "$GEARHOME/.local/magisk"
echo "- Done!"