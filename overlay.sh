#!/system/bin/sh

export PATH=/sbin:/system/bin:/system/xbin

mnt_tmpfs(){ (
# MOUNT TMPFS ON A DIRECTORY
MOUNTPOINT="$1"
mkdir -p "$MOUNTPOINT"
mount -t tmpfs -o "mode=0755" tmpfs "$MOUNTPOINT"
) }

mnt_bind(){ (
# SHORTCUT BY BIND MOUNT
FROM="$1"; TO="$2"
if [ -L "$FROM" ]; then
SOFTLN="$(readlink "$FROM")"
ln -s "$SOFTLN" "$TO"
elif [ -d "$FROM" ]; then
mkdir -p "$TO" 2>/dev/null
mount --rbind "$FROM" "$TO"
else
echo -n 2>/dev/null >"$TO"
mount --rbind "$FROM" "$TO"
fi
) }

clone(){ (
FROM="$1"; TO="$2"; IFS=$"
"
[ -d "$TO" ] || exit 1;
( cd "$FROM" && find * ) | while read obj; do
if [ -d "$FROM/$obj" ]; then
mnt_tmpfs "$TO/$obj"
else
mnt_bind "$FROM/$obj" "$TO/$obj" 2>/dev/null
fi
done
) }

overlay(){ (
# RE-OVERLAY A DIRECTORY
FOLDER="$1";
TMPFOLDER="/dev/vm-overlay"
#_____
PAYDIR="$TMPFOLDER/$RANDOM_$(date | base64)"
mkdir -p "$PAYDIR"
mnt_tmpfs "$PAYDIR"
#_________
clone "$FOLDER" "$PAYDIR"
mnt_bind "$PAYDIR" "$FOLDER"
#______________
) }

overlay /sbin
chcon u:r:rootfs:s0 /sbin
cd /system/etc/magisk
MAGISKTMP=/sbin
MAGISKBIN=/data/adb/magisk
mkdir -p $MAGISKBIN
for mdir in modules post-fs-data.d service.d; do
mkdir /data/adb/$mdir
done

for file in magisk32 magisk64 magiskinit; do
  chmod 755 ./$file
  cp -af ./$file $MAGISKTMP/$file
  cp -af ./$file $MAGISKBIN/$file
done
cp -af ./magiskboot $MAGISKBIN/magiskboot
cp -af ./busybox $MAGISKBIN/busybox
cp -af ./loadpolicy.sh $MAGISKTMP

ln -s ./magisk64 $MAGISKTMP/magisk
ln -s ./magisk $MAGISKTMP/su
ln -s ./magisk $MAGISKTMP/resetprop
ln -s ./magisk $MAGISKTMP/magiskhide
ln -s ./magiskinit $MAGISKTMP/magiskpolicy

mkdir -p $MAGISKTMP/.magisk/mirror
mkdir $MAGISKTMP/.magisk/block
touch $MAGISKTMP/.magisk/config

cd $MAGISKTMP
# SELinux stuffs
ln -sf ./magiskinit magiskpolicy
if [ -f /vendor/etc/selinux/precompiled_sepolicy ]; then
  ./magiskpolicy --load /vendor/etc/selinux/precompiled_sepolicy --live --magisk 2>&1
elif [ -f /sepolicy ]; then
  ./magiskpolicy --load /sepolicy --live --magisk 2>&1
else
  ./magiskpolicy --live --magisk 2>&1
fi

touch /dev/.overlay_unblock