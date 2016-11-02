#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq app-admin/sysklogd
rc-update add sysklogd default
emerge -vq sys-process/cronie
rc-update add cronie default
emerge -vq sys-apps/mlocate
rc-update add sshd default
emerge -vq net-misc/dhcpcd
EOF
