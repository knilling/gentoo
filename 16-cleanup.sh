#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
eselect news read > /dev/null
EOF
