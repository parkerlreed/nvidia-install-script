#!/bin/sh
apt-get install module-assistant nvidia-kernel-common &&
m-a auto-install nvidia-kernel${VERSION}-source &&
apt-get install nvidia-glx${VERSION} &&
cat > /etc/X11/xorg.conf << EOF
Section "Module"
    Load        "glx"
EndSection

Section "Device"
    Identifier  "Video Card"
    Driver              "nvidia"
EndSection
EOF
