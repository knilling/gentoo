#!/bin/bash

DRIVE=/dev/sda
parted -s $DRIVE mklabel msdos
parted -s $DRIVE "mkpart primary 1MB 128MB"
parted -s $DRIVE "mkpart primary 128MB 640MB"
parted -s $DRIVE "mkpart primary 640MB -1s"
parted -s $DRIVE "set 1 boot on"

mkfs.ext2 -F -L boot -T small /dev/sda1
mkfs.ext4 -F -L root -j /dev/sda3

mkswap /dev/sda2 && swapon /dev/sda2
