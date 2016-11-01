#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cat > /etc/fstab <<'DATA'
# <fs>		<mount>	<type>	<opts>		<dump/pass>
/dev/sda1	/boot		ext2		noauto,noatime	1 2
/dev/sda2	none		swap		sw				0 0
/dev/sda3	/			ext4		noatime			0 1
DATA
EOF
