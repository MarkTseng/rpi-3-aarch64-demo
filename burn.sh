#!/bin/bash

mount /dev/mmcblk0p1 /mnt/tmp
rm -f /mnt/tmp/kern*.img
rm -f /mnt/tmp/armstub*.bin
cp config.txt /mnt/tmp
cp app.bin /mnt/tmp/kernel8.img
umount /mnt/tmp
