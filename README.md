# MiSTy buildroot

Creates the SD card image for the Linux root filesystem
of MiSTy

## Building
```
  git submodule init
  git submodule update
  make docker-image
  make rootshell
  make image
```