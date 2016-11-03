#!/bin/bash

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync -v -q
cat > /etc/portage/make.conf <<'DATA'
# Please consult /usr/share/portage/config/make.conf.example for a more
# detailed example.
CFLAGS="-march=native -O2 -pipe"
CXXFLAGS="${CFLAGS}"
# WARNING: Changing your CHOST is not something that should be done lightly.
# Please consult http://www.gentoo.org/doc/en/change-chost.xml before changing.
CHOST="x86_64-pc-linux-gnu"
# These are the USE and USE_EXPAND flags that were used for
# buidling in addition to what is provided by the profile.
USE="bindist"
CPU_FLAGS_X86="aes mcx16 msahf popcnt sse sse2 sse3 sse4.1 sse4.2 ssse3 mmx"
PORTDIR="/usr/portage"
DISTDIR="${PORTDIR}/distfiles"
PKGDIR="${PORTDIR}/packages"
MAKEOPTS="-j12"
DATA
EOF
