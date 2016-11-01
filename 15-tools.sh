#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
echo ">=sys-libs/libseccomp-2.3.0 static-libs" > /etc/portage/package.use/docker
emerge -vq app-emulation/docker
groupadd docker
usermod -a -G docker vagrant
rc-update add docker default
cat << FILE > /etc/portage/package.keywords/docker-compose
=dev-python/docker-pycreds-0.2.1 ~amd64
=dev-python/backports-ssl-match-hostname-3.5.0.1-r1 ~amd64
=app-emulation/docker-compose-1.8.1 ~amd64
=dev-python/texttable-0.8.3 ~amd64
=dev-python/jsonschema-2.5.1-r2 ~amd64
=dev-python/webcolors-1.5 ~amd64
=dev-python/websocket-client-0.37.0 ~amd64
=dev-python/docker-py-1.10.3 ~amd64
=dev-python/functools32-3.2.3 ~amd64
=dev-python/ipaddress-1.0.17 ~amd64
=dev-python/vcversioner-2.16.0.0 ~amd64
=dev-python/strict-rfc3339-0.7 ~amd64
=dev-python/cached-property-1.3.0 ~amd64
=dev-python/dockerpty-0.4.1 ~amd64
FILE
emerge -vq app-emulation/docker-compose
emerge net-misc/dhcpcd
EOF
