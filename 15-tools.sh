#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq app-admin/sysklogd
rc-update add sysklogd default
emerge -vq sys-process/cronie
rc-update add cronie default
emerge -vq sys-apps/mlocate
rc-update add sshd default
emerge -vq net-misc/dhcpcd
USE="minimal" emerge -vq vim
emerge -vq dev-vcs/git
cat > /etc/portage/package.keywords/vagrant <<'DATA'
=dev-ruby/nokogiri-1.6.8.1 ~amd64
=dev-ruby/hashicorp-checkpoint-0.1.4-r1 ~amd64
=dev-ruby/rest-client-1.8.0-r3 ~amd64
=dev-ruby/bundler-1.12.6 ~amd64
=dev-ruby/pkg-config-1.1.7 ~amd64
=dev-ruby/i18n-0.7.0-r2 ~amd64
=dev-ruby/net-ssh-3.2.0 ~amd64
=dev-ruby/rb-inotify-0.9.7-r1 ~amd64
=dev-ruby/ruby_dep-1.5.0 ~amd64
=app-emulation/vagrant-1.8.6 ~amd64
=dev-ruby/listen-3.1.5 ~amd64
DATA
cat > /etc/portage/package.use/vagrant << DATA
>=media-libs/libsdl-1.2.15-r9 X
DATA
cat > /etc/portage/package.use/virtualbox << DATA
headless
DATA
USE="cpu_flags_x86_mmx" emerge -vq vagrant
mkdir -p /etc/portage/package.license
echo "=app-emulation/virtualbox-extpack-oracle-4.3.38.106717 PUEL" > /etc/portage/package.license/virtualbox-extpack-oracle
emerge virtualbox-extpack-oracle
QEMU_SOFTMMU_TARGETS="x86_64 arm i386" USE="xen virtfs ssh" emerge -vq qemu
EOF
