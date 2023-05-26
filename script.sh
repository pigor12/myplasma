#!/bin/bash

# Eficiência energética
dnf install -yq kernel-tools tlp tlp-rdw powertop
grubby --args="amd_pstate=passive" --update-kernel=ALL
powertop --calibrate
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
systemctl enable --now tlp.service
systemctl enable --now cpupower.service


# Drivers
dnf install -yq pipewire pipewire-pulseaudio mesa-dri-drivers mesa-va-drivers mesa-vdpau-drivers

# KDE Plasma
dnf install -yq plasma-workspace-wayland sddm-plasma-wayland sddm-breeze sddm-kcm bluedevil powerdevil \
plasma-pa plasma-nm kile kate-plugins kwrite plasma-milou kdesettings-pulseaudio dolphin ark unzip bzip2 \
tar xz kdeplasma-addons dolphin-plugins xdg-desktop-portal-kde xdg-desktop-portal-gtk breeze-gtk kde-gtk-config \
flatpak-kcm flatpak plasma-firewall kdeconnect

# Flatpak
flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
