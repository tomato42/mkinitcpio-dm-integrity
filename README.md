# mkinitcpio-dm-integrity
dm-integrity module for the mkinitcpio initramfs used in Archlinux

It's used to mount the dm-integrity volumes in initramfs, so that they
are available for MD-RAID or LVM2 with the root file system.

## Installation
1. Copy the `scripts/hooks/dm_integrity` file to `/usr/lib/initcpio/hooks/`
2. Copy the `scritps/install/dm_integrity` file to
   `/usr/lib/initcpio/install/`
3. Copy the `scripts/etc/integrity.sh` file to `/etc/`
4. Edit the `/etc/integrity.sh` file to point to partitions with specified
   PARTUUIDS and uses the integrity hash (the `-I` option) of the devices
   you have created. Use `blkid /dev/sdXY` to get the PARTUUIDs.
5. Edit the `/etc/mkinitcpio.conf` and add the `dm_integrity` in the `HOOKS`
   array after the `block` and before the `mdadm_udev` hooks.
   Also add the `shutdown` hook to make sure the devices are orderly stopped
   on power-off
