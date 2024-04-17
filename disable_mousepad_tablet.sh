sudo rm -f /etc/udev/hwdb.d/60-touchpad.hwdb
sudo systemd-hwdb update
sudo reboot -f
