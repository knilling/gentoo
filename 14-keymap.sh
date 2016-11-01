#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
  sed -i "s/keymap=\".*\"/keymap=\"us\"/" /etc/conf.d/keymaps
EOF
