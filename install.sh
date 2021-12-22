#!/system/bin/sh

export PATH=/sbin:/system/bin:/system/xbin

# This script is write by HuskyDG
ARG1="$1"

abort(){
echo "$1" ; exit 1
}

install_magisk(){
echo "******************************"
echo "      Magisk installer"
echo "******************************"

overlay_loader="#!/system/bin/sh

export PATH=/sbin:/system/bin:/system/xbin

mnt_tmpfs(){ (
# MOUNT TMPFS ON A DIRECTORY
MOUNTPOINT=\"\$1\"
mkdir -p \"\$MOUNTPOINT\"
mount -t tmpfs -o \"mode=0755\" tmpfs \"\$MOUNTPOINT\"
) }

mnt_bind(){ (
# SHORTCUT BY BIND MOUNT
FROM=\"\$1\"; TO=\"\$2\"
if [ -L \"\$FROM\" ]; then
SOFTLN=\"\$(readlink \"\$FROM\")\"
ln -s \"\$SOFTLN\" \"\$TO\"
elif [ -d \"\$FROM\" ]; then
mkdir -p \"\$TO\" 2>/dev/null
mount --rbind \"\$FROM\" \"\$TO\"
else
echo -n 2>/dev/null >\"\$TO\"
mount --rbind \"\$FROM\" \"\$TO\"
fi
) }

clone(){ (
FROM=\"\$1\"; TO=\"\$2\"; IFS=\$\"
\"
[ -d \"\$TO\" ] || exit 1;
( cd \"\$FROM\" && find * ) | while read obj; do
if [ -d \"\$FROM/\$obj\" ]; then
mnt_tmpfs \"\$TO/\$obj\"
else
mnt_bind \"\$FROM/\$obj\" \"\$TO/\$obj\" 2>/dev/null
fi
done
) }

overlay(){ (
# RE-OVERLAY A DIRECTORY
FOLDER=\"\$1\";
TMPFOLDER=\"/dev/vm-overlay\"
#_____
PAYDIR=\"\$TMPFOLDER/\$RANDOM_\$(date | base64)\"
mkdir -p \"\$PAYDIR\"
mnt_tmpfs \"\$PAYDIR\"
#_________
clone \"\$FOLDER\" \"\$PAYDIR\"
mnt_bind \"\$PAYDIR\" \"\$FOLDER\"
#______________
) }

mount -o rw,remount /
rm -rf /root
mkdir /root
ln /sbin/* /root
mount -o ro,remount /

mnt_tmpfs /sbin
clone /root /sbin

chcon u:r:rootfs:s0 /sbin
cd /system/etc/magisk
MAGISKTMP=/sbin
MAGISKBIN=/data/adb/magisk
mkdir -p \$MAGISKBIN
for mdir in modules post-fs-data.d service.d; do
mkdir /data/adb/\$mdir
done

for file in magisk32 magisk64 magiskinit; do
  chmod 755 ./\$file
  cp -af ./\$file \$MAGISKTMP/\$file
  cp -af ./\$file \$MAGISKBIN/\$file
done
cp -af ./magiskboot \$MAGISKBIN/magiskboot
cp -af ./busybox \$MAGISKBIN/busybox
cp -af ./loadpolicy.sh \$MAGISKTMP

ln -s ./magisk64 \$MAGISKTMP/magisk
ln -s ./magisk \$MAGISKTMP/su
ln -s ./magisk \$MAGISKTMP/resetprop
ln -s ./magisk \$MAGISKTMP/magiskhide
ln -s ./magiskinit \$MAGISKTMP/magiskpolicy

mkdir -p \$MAGISKTMP/.magisk/mirror
mkdir \$MAGISKTMP/.magisk/block
touch \$MAGISKTMP/.magisk/config

cd \$MAGISKTMP
# SELinux stuffs
ln -sf ./magiskinit magiskpolicy
if [ -f /vendor/etc/selinux/precompiled_sepolicy ]; then
  ./magiskpolicy --load /vendor/etc/selinux/precompiled_sepolicy --live --magisk 2>&1
elif [ -f /sepolicy ]; then
  ./magiskpolicy --load /sepolicy --live --magisk 2>&1
else
  ./magiskpolicy --live --magisk 2>&1
fi

touch /dev/.overlay_unblock"

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
rm -rf $MAGISKCORE/overlay.sh
echo "$overlay_loader" >$MAGISKCORE/overlay.sh
rm -rf /system/etc/init/magisk.rc
echo "$magiskloader" >/system/etc/init/magisk.rc
rm -rf /system/etc/magisk/loadpolicy.sh
echo "$shloadpolicy" >/system/etc/magisk/loadpolicy.sh
echo "- Install Magisk App..."
pm uninstall com.topjohnwu.magisk &>/dev/null
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