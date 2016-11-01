#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cat > /etc/env.d/02locale <<'LOC'
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
LC_LANG="en_US.UTF-8"
LOC
sed -i "s/#en_US\.UTF-8/en_US\.UTF-8/" /etc/locale.gen
locale-gen
EOF