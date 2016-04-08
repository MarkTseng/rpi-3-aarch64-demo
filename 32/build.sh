#!/bin/bash

set -e
set -x

CROSS_COMPILE=arm-linux-gnueabi-

${CROSS_COMPILE}gcc -c -o start.o start.S
${CROSS_COMPILE}gcc -c -mcpu=cortex-a7 -std=gnu99 -Wall -o app.o app.c
${CROSS_COMPILE}ld -Bstatic --gc-sections -nostartfiles -nostdlib -o app.elf -Ttext 0x8000 -T app.lds start.o app.o
${CROSS_COMPILE}objcopy --gap-fill=0xff -j .text -j .rodata -j .data -O binary app.elf app.bin
${CROSS_COMPILE}objdump -d app.elf > app.dis
