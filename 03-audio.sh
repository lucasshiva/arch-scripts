#!/usr/bin/sh

# Audio packages for Arch Linux.

packages=(
    pulseaudio          # A featureful, general-purpose sound server
    pulseaudio-alsa     # ALSA Configuration for PulseAudio
    pavucontrol         # PulseAudio Volume Control
    pamixer             # Pulseaudio command-line mixer
    alsa-firmware       # Firmware binaries
    alsa-lib            # Alternative implementation of Linux sound support
    alsa-plugins        # Additional ALSA plugins
    alsa-utils          # Utils for ALSA
    gstreamer           # GStreamer framework core library
    gst-plugins-good    # GStreamer framework plugins
    gst-plugins-bad     # GStreamer framework plugins
    gst-plugins-base    # GStreamer framework plugins
    gst-plugins-ugly    # GStreamer framework plugins
    gst-libav           # GStreamer framework FFmpeg plugin
    playerctl           # mpris media player controller
    volumeicon          # Volume control for the system tray
    pulseeffects        # Audio Effects for Pulseaudio Applications
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

echo "Done!"
