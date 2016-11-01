#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cd /usr/src/linux && make clean
emerge -vqC sys-kernel/gentoo-sources
emerge -vq --depclean
EOF

rm -rf /mnt/gentoo/usr/portage/*
rm -rf /mnt/gentoo/tmp/*
rm -rf /mnt/gentoo/var/log/*
rm -rf /mnt/gentoo/var/tmp/*

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage/metadata/
echo "masters = gentoo" >> /usr/portage/metadata/layout.conf
EOF

chroot /mnt/gentoo /bin/bash <<'EOF'
wget http://frippery.org/uml/zerofree-1.0.4.tgz
tar xvzf zerofree-*.tgz
cd zerofree*/
make
EOF

mv /mnt/gentoo/zerofree* ./
cd zerofree*/

mount -o remount,ro /mnt/gentoo
./zerofree /dev/sda3

swapoff /dev/sda2
dd if=/dev/zero of=/dev/sda2
mkswap /dev/sda2
