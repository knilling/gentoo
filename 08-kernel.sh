#!/bin/bash

# https://wiki.gentoo.org/wiki/Gentoo_installation_tips_and_tricks#Using_the_Installation_CD_kernel
cp -v /mnt/cdrom/isolinux/gentoo /mnt/gentoo/boot/kernel-gentoo
cp -v /mnt/cdrom/isolinux/gentoo.igz /mnt/gentoo/boot/initrd-gentoo
mkdir -p /mnt/gentoo/lib/modules
cp -Rp /lib/modules/`uname -r` /mnt/gentoo/lib/modules

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq sys-kernel/gentoo-sources
printf "modules=\"" >> /etc/conf.d/modules
cat /proc/modules | cut -d ' ' -f 1 >> /etc/conf.d/modules
printf "\"\n" >> /etc/conf.d/modules
EOF
