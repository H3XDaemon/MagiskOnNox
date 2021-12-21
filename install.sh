#!/system/bin/sh

# This script is write by HuskyDG
ARG1="$1"

abort(){
echo "$1" ; exit 1
}



install_magisk(){
echo "******************************"
echo "      Magisk installer"
echo "******************************"

cd "${0%/*}"
JOBPWD="${0%/*}"
shloadpolicy="#!/system/bin/sh
          for module in \$(ls /data/adb/modules); do
              if ! [ -f \"/data/adb/modules/\$module/disable\" ] && [ -f \"/data/adb/modules/\$module/sepolicy.rule\" ]; then
                  /sbin/magiskpolicy --live --apply \"/data/adb/modules/\$module/sepolicy.rule\"
              fi
          done"

magiskloader="on post-fs-data
              start logd
              start adbd
              rm /dev/.overlay_unblock
              start magiskoverlay
              wait /dev/.overlay_unblock 10
              rm /dev/.overlay_unblock
              
              rm /dev/.magisk_unblock
              start IhhslLhHYfse
              start FAhW7H9G5sf
              wait /dev/.magisk_unblock 40
              rm /dev/.magisk_unblock

          service magiskoverlay /system/bin/sh /system/etc/magisk/overlay.sh
             user root
             group root
             oneshot

          service IhhslLhHYfse /system/bin/sh /sbin/loadpolicy.sh
              user root
              seclabel u:r:magisk:s0
              oneshot

          service FAhW7H9G5sf /sbin/magisk --post-fs-data
              user root
              seclabel u:r:magisk:s0
              oneshot

          service HLiFsR1HtIXVN6 /sbin/magisk --service
              class late_start
              user root
              seclabel u:r:magisk:s0
              oneshot

          on property:sys.boot_completed=1
              start YqCTLTppv3ML

          service YqCTLTppv3ML /sbin/magisk --boot-complete
              user root
              seclabel u:r:magisk:s0
              oneshot"

bb=/data/local/tmp/busybox
TMPDIR=/dev/tmp
APKFILE="$JOBPWD/magisk.apk"
MAGISKCORE=/system/etc/magisk

[ "$(whoami)" == "root" ] || abort "! Run script as root only"

echo "- Mount system read-write..."
mount -o rw,remount /system || abort "! Failed to mount system"

echo "- Set up Magisk core..."
mkdir -p $MAGISKCORE

rm -rf $bb
cp ./busybox $bb
chmod 777 $bb
mkdir $TMPDIR

$bb unzip -oj "$APKFILE" 'assets/util_functions.sh' -d "$TMPDIR"
. $TMPDIR/util_functions.sh

api_level_arch_detect

mkdir -p /system/etc/magisk

$bb unzip -oj "$APKFILE" "lib/$ABI/*" "lib/$ABI32/libmagisk32.so" -x "lib/$ABI/busybox.so" -d "$TMPDIR"


( cd "$TMPDIR"
for file in lib*.so; do
  chmod 755 $file
  mv "$file" "/system/etc/magisk/${file:3:${#file}-6}"
done
)


mkdir -p $MAGISKBIN 2>/dev/null
$bb unzip -oj "$APKFILE" 'assets/*' -x 'assets/chromeos/*' -d $MAGISKBIN
mkdir $NVBASE/modules 2>/dev/null
mkdir $POSTFSDATAD 2>/dev/null
mkdir $SERVICED 2>/dev/null


echo "- Install Magisk loader..."
cp ./overlay.sh $MAGISKCORE/overlay.sh
rm -rf /system/etc/init/magisk.rc
echo "$magiskloader" >/system/etc/init/magisk.rc
rm -rf /system/etc/magisk/loadpolicy.sh
echo "$shloadpolicy" >/system/etc/magisk/loadpolicy.sh
echo "- Install Magisk App..."
pm install magisk.apk &>/dev/null || echo "* Please install Magisk app by yourself"
echo "- Mount system read-only..."
mount -o ro,remount /system
echo "- Done!"
}

uninstall_magisk(){
echo "******************************"
echo "      Magisk uninstaller"
echo "******************************"
echo "- Mount system read-write..."
mount -o rw,remount /system || abort "! Failed to mount system"
echo "- Remove Magisk..."
for fun in /system/etc/magisk /system/etc/init/magisk.rc; do
rm -rf $fun
done
echo "- Mount system read-only..."
mount -o ro,remount /system
echo "- Done!"
}


if [ "$ARG1" == "uninstall" ]; then
uninstall_magisk 2>/dev/null
else
install_magisk 2>/dev/null
fi