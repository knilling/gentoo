#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
USE="-sendmail" emerge app-admin/sudo
echo root:toor | chpasswd
EOF
