#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq "=virtual/linux-sources-1"

emerge -vq  ">=app-emulation/virtualbox-guest-additions-5.0.20" --autounmask-write
etc-update --automode -5
emerge -vq  ">=app-emulation/virtualbox-guest-additions-5.0.20"

rc-update add virtualbox-guest-additions default
EOF
