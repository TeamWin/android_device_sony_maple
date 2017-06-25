#!/sbin/sh

# This pulls the files out of /system that are needed for decrypt and module loading
# This allows us to decrypt the device in recovery and still be
# able to unmount /system when we are done.

mkdir -p /system
mount -t ext4 -o ro /dev/block/bootdevice/by-name/system /system

# Copy proprietary kernel modules
cp /system/lib/modules/kscl.ko /sbin/kscl.ko
cp /system/lib/modules/texfat.ko /sbin/texfat.ko

# Load proprietary kernel modules
insmod /sbin/kscl.ko
insmod /sbin/texfat.ko

umount /system
