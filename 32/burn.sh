#!/bin/bash

mount /dev/mmcblk0p1 /mnt/tmp
rm -f /mnt/tmp/kern*.img
rm -f /mnt/tmp/armstub*.bin
cp config.txt /mnt/tmp
#../../mkknlimg --dtok app.bin app.bin.img
#cp app.bin.img /mnt/tmp/kernel8-32.img
cp app.bin /mnt/tmp/kernel8-32.img
umount /mnt/tmp
