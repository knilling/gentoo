#!/bin/bash

# From https://wiki.gentoo.org/wiki/Gentoo_installation_tips_and_tricks
# Using the Installation CD kernel
chroot /mnt/gentoo /bin/bash <<'EOF'
KN=gentoo
cp /mnt/cdrom/isolinux/${KN} /mnt/cdrom/isolinux/${KN}.igz /mnt/gentoo/boot
mkdir -p /mnt/gentoo/lib/modules
cp -Rp /lib/modules/`uname -r` /mnt/gentoo/lib/modules
printf "modules=\"" >> /etc/conf.d/modules
cat /proc/modules | cut -d ' ' -f 1 >> /etc/conf.d/modules
printf "\"\n" >> /etc/conf.d/modules
EOF
