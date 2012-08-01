#!/bin/bash
#Downloads and installs module-assistant and nvidia-kernel-common
apt-get install module-assistant nvidia-kernel-common &&
#Downloads and installs the files for you current kernel version.
m-a auto-install nvidia-kernel${VERSION}-source &&
#Downloads drivers and utilities specific to yorur kernel version.
apt-get install nvidia-glx${VERSION} &&
#Creates a basic xorg.conf file for X to load.
cat > /etc/X11/xorg.conf << EOF
Section "Module"
    Load        "glx"
EndSection

Section "Device"
    Identifier  "Video Card"
    Driver              "nvidia"
EndSection
EOF
