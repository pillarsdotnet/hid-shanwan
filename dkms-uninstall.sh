#!/bin/bash
# Re-run with sudo if we're not root.
[ "$EUID" -eq 0 ] || exec sudo "$0" "$@"
# Unload the module from the running kernel.
modprobe -r hid-shanwan
# Remove the built module.
dkms uninstall hid-shanwan/1.0
# Remove the source symlink.
dkms remove -m hid-shanwan -v 1.0
# Remove the source directory.
rm -rf /usr/src/hid-shanwan-1.0
