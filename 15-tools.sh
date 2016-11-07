#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq app-admin/sysklogd
rc-update add sysklogd default
emerge -vq sys-process/cronie
rc-update add cronie default
emerge -vq sys-apps/mlocate
rc-update add sshd default
emerge -vq net-misc/dhcpcd
mkdir -p /etc/portage/package.use/app-editors/
echo ">=app-editors/vim-7.4.769 minimal" > /etc/portage/package.use/app-editors/vim
emerge -vq app-editors/vim
emerge -vq dev-vcs/git
emerge -vq sys-process/lsof
emerge -vq sys-process/htop
mkdir -p /etc/portage/package.use/app-emulation/
echo ">=app-emulation/virtualbox-5.1.8 vnc" > /etc/portage/package.use/app-emulation/virtualbox
cat >> /etc/portage/package.accept_keywords << 'DATA'
>=dev-util/kbuild-0.1.9998_pre20131130-r1 ~amd64
>=app-emulation/virtualbox-modules-5.1.8 ~amd64
>=app-emulation/virtualbox-extpack-oracle-5.1.8 ~amd64
>=dev-libs/libpcre-8.38-r1 pcre16
>=app-emulation/virtualbox-5.1.8 ~amd64
DATA
emerge -vq app-emulation/virtualbox
gpasswd -a chris vboxusers
mkdir -p /etc/portage/package.license/app-emulation/
echo ">=app-emulation/virtualbox-extpack-oracle-4.3.38.106717 PUEL" > /etc/portage/package.license/app-emulation/virtualbox-extpack-oracle
emerge -vq app-emulation/virtualbox-extpack-oracle
mkdir -p /etc/portage/package.keywords/app-emulation/
cat > /etc/portage/package.keywords/app-emulation/vagrant <<'DATA'
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
emerge -vq app-emulation/vagrant
mkdir -p /etc/portage/package.use/app-emulation/
echo ">=app-emulation/qemu-2.7.0 xen virtfs ssh" > /etc/portage/package.use/app-emulation/qemu
QEMU_SOFTMMU_TARGETS="x86_64 arm i386" emerge -vq app-emulation/qemu
EOF
