#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
USE="-sendmail" emerge -vq app-admin/sudo
echo root:toor | chpasswd
useradd -m -G users,wheel -s /bin/bash chris
echo chris:changeme | chpasswd
echo 'chris ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/chris
EOF
