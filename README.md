# MiSTeX buildroot

Creates the SD card image for the Linux root filesystem
of MiSTeX and the SDK for building the main executable.

The first version of MiSTeX used the RISCV Lichee RV
board. Because of poor hardware and software stability,
we decided to move to the raspberry pi zero.

## Building
The raspberry pi zero buildroot builds successfully
under Ubuntu 22.04.2 LTS. Uses about 18GB of disk space.

```
  sudo apt-get install -y git make build-essential file wget cpio unzip rsync bc dosfstools
  git clone https://github.com/MiSTeX-devel/MiSTeX-buildroot.git
  cd MiSTeX-buildroot
  git submodule init
  git submodule update
  cd rpi-zero
  ./build.sh
```

the results are then found here:
- buildroot/output/images/sdcard.img
- buildroot/output/images/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz

The first is to be flashed to sdcard,
the second is the SDK which is used to build Main_MiSTeX.
