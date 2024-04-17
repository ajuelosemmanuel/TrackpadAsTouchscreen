# TrackpadAsTouchscreen

## Credits

All the credit goes to [u/emptythevoid](https://www.reddit.com/user/emptythevoid/), who mentionned the method in [this Reddit thread](https://www.reddit.com/r/Ubuntu/comments/ty54lj/is_there_a_way_to_use_a_laptops_touchpad_in/). I just made some scripts to make it more convenient for me.

## Prerequisites

Install `xinput-calibrator` :
```bash
sudo apt install xinput-calibrator
```

## Tutorial

Run the following command : `udevadm info -e | grep -i -A 10 touchpad` to try to find the modalias for your touchpad. Exemple : `input:b0018v0488p121Fe0100-e0`

Then, replace [MODALIAS] with yours in the following script :
```bash
sudo echo -e "id-input:modalias:[MODALIAS]*\n ID_INPUT_TOUCHPAD=0\n ID_INPUT_TOUCHSCREEN=1" >> /etc/udev/hwdb.d/60-touchpad.hwdb
sudo systemd-hwdb update
sudo reboot -f
```

To run it, simply do : `sudo bash [NAMEOFTHESCRIPT]`

Your computer is gonna reboot, and then you can run `xinput_calibrator` and touch the four corners of your trackpad. If it doesn't work, something went wrong.

To disable this, run this script (still using `sudo bash [NAMEOFTHESECONDSCRIPT]`) :
```
sudo rm -f /etc/udev/hwdb.d/60-touchpad.hwdb
sudo systemd-hwdb update
sudo reboot -f
```
