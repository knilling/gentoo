#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
USE="-sendmail" emerge -vq app-admin/sudo
echo root:toor | chpasswd
EOF
