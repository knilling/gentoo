#!/bin/bash

cd /
mount /dev/sda1 /mnt/gentoo/boot
mkdir /mnt/gentoo/boot/efi
mount /dev/sda2 /boot/efi
mount -t proc proc /mnt/gentoo/proc
mount --rbind /dev /mnt/gentoo/dev
mount --rbind /sys /mnt/gentoo/sys
