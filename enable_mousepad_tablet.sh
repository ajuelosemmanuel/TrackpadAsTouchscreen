sudo echo -e "id-input:modalias:[MODALIAS]*\n ID_INPUT_TOUCHPAD=0\n ID_INPUT_TOUCHSCREEN=1" >> /etc/udev/hwdb.d/60-touchpad.hwdb
sudo systemd-hwdb update
sudo reboot -f
