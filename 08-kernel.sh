#!/bin/bash

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq sys-kernel/gentoo-sources
cd /usr/src/linux
mv /tmp/kernel.config .config
echo 'make'
make -s
echo 'make modules_install'
make -s modules_install
echo 'make install'
make -s install
EOF
