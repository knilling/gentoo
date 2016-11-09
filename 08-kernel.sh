#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -qv -j15 --load-average 8 sys-kernel/gentoo-sources
EOF

zcat /proc/config.gz > /mnt/gentoo/usr/src/linux/.config

chroot /mnt/gentoo /bin/bash <<'EOF'
pushd /usr/src/linux
make -j8
make modules_install
cp -v arch/x86_64/boot/bzImage /boot/kernel-4.4.26-gentoo
cp -v .config /boot/config-4.4.26-gentoo
cp -v System.map /boot/System.map-4.4.26-gentoo
ln -sf /boot/System.map-4.4.26-gentoo /boot/System.map
popd
emerge -qv -j15 --load-average 8 sys-kernel/genkernel
genkernel --install initramfs
printf "modules=\"" >> /etc/conf.d/modules
cat /proc/modules | cut -d ' ' -f 1 >> /etc/conf.d/modules
printf "\"\n" >> /etc/conf.d/modules
EOF
