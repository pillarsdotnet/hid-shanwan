#!/bin/bash
set -e
# Re-run with sudo if we're not root.
[ "$EUID" -eq 0 ] || exec sudo "$0" "$@"
# Copy this source into the proper directory.
cp -r $(dirname $0) /usr/src/hid-shanwan-1.0
# Symlink the source into the DKMS build tree.
dkms add -m hid-shanwan -v 1.0
# Build and install the module.
dkms install hid-shanwan/1.0
# Load the module into the running kernel.
modprobe hid-shanwan
