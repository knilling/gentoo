#!/bin/bash

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync -v -q
echo "MAKEOPTS=\"-j12\"" >> /etc/portage/make.conf
EOF
