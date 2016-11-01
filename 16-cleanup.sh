#!/bin/bash

umount -l /mnt/gentoo/dev{/shm,/pts,}
umount /mnt/gentoo{/boot,/sys,/proc,}
rm /stage3-*.tar.bz2*
