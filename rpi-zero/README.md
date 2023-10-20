# MiSTeX buildroot

Creates the SD card image for the Linux root filesystem
of MiSTeX
The first version of MiSTeX used the RISCV Lichee RV
board. Because of poor hardware and software stability,
we decided to move to the raspberry pi zero.

## Building
The raspberry pi zero buildroot builds successfully
under Ubuntu 22.04.2 LTS.

```
  git submodule init
  git submodule update
  cd rpi-zero
  ./build.sh
```