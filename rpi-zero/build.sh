#!/bin/bash
cd buildroot
make BR2_EXTERNAL=../buildroot-external mistex_defconfig
# This builds the sdcard image and the SDK
make BR2_EXTERNAL=../buildroot-external sdk