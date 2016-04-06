This repository contains a simple AArch64 test for the Raspberry Pi 3.
It relies on the VideoCore firmware providing a suitable 64-bit ARM stub.
As of 20160406, the released version doesn't, but a pre-release is available at
https://github.com/raspberrypi/firmware/issues/579#issuecomment-205525205.

If you want to experiment with changes to the ARM stub code, find the source
at: https://github.com/raspberrypi/tools/tree/master/armstubs. You can copy
armstub8.bin to the boot partition on the SD card, and the FW will use that
file rather than the built-in version.

Some of the application code is stolen from U-Boot, including some from my
recently upstreamed AArch32 port of U-Boot to the Raspberry Pi 3:
* git://git.denx.de/u-boot.git
* git://github.com/swarren/u-boot.git

To build, simply run `./build.sh`. This was tested on Ubuntu 16.04. You will
need an aarch64-linux-gnu-gcc binary (i.e. gcc-aarch64-linux-gnu package) or
equivalent.

To make a bootable SD card, start with a recent Raspbian image, update all the
firmware files to a version that includes the 64-bit ARM stub, and:
* Copy config.txt to the boot partition.
* Delete `armstub*.bin` from the boot partition.
* Delete `kernel*.img` from the boot partition.
* Copy `app.bin` to the boot partition as `kernel8.img`.

You'll need a serial console running at 115200 baud to observe the code
running.

If you want to use the PL011 UART instead of the mini UART, you'll need to
perform at least the following steps:
* Modify app.c's UART IO routines.
* run mkknlimg on app.bin rather than using it raw. This tells the VC FW to
process DT overlays, and doing so is required to switch between UARTs.
* Add "dtoverlay=pi3-miniuart-bt" to config.txt.
