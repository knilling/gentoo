#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq sys-kernel/gentoo-sources
emerge -vq sys-kernel/genkernel
genkernel all
EOF