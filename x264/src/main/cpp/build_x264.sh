#!/bin/bash

set -e

ARM_PLATFORM=$NDK_PATH/platforms/android-9/arch-arm/
ARM_PREBUILT=$NDK_PATH/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
AARCH64_PLATFORM=$NDK_PATH/platforms/android-21/arch-arm64/
AARCH64_PREBUILT=$NDK_PATH/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
X86_PLATFORM=$NDK_PATH/platforms/android-9/arch-x86/
X86_PREBUILT=$NDK_PATH/toolchains/x86-4.9/prebuilt/linux-x86_64

function build_one
{
if [ $ARCH == "arm" ] 
then
    SYSROOT=$ARM_PLATFORM
    PREBUILT=$ARM_PREBUILT
    CROSS_PREFIX=$PREBUILT/bin/arm-linux-androideabi-
    HOST=arm-linux
elif [ $ARCH == "aarch64" ] 
then
    SYSROOT=$AARCH64_PLATFORM
    PREBUILT=$AARCH64_PREBUILT
    CROSS_PREFIX=$PREBUILT/bin/aarch64-linux-android-
    HOST=aarch64-linux
else
    SYSROOT=$X86_PLATFORM
    PREBUILT=$X86_PREBUILT
    CROSS_PREFIX=$PREBUILT/bin/i686-linux-android-
    HOST=i686-linux
fi

pushd libx264
./configure --prefix=$PREFIX \
        --host=$HOST \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$OPTIMIZE_CFLAGS" \
        --extra-ldflags="-nostdlib" \
        --enable-pic \
        --enable-static \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash

make clean
make -j4 install V=1
popd
}

#arm v7vfpv3
CPU=armv7-a
ARCH=arm
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfpv3-d16 -marm -march=$CPU "
PREFIX=`pwd`/prebuilt/armeabi-v7a
build_one

#arm64-v8a
CPU=arm64-v8a
ARCH=aarch64
OPTIMIZE_CFLAGS="-march=armv8-a"
PREFIX=`pwd`/prebuilt/arm64-v8a
build_one

#x86
CPU=i686
ARCH=i686
OPTIMIZE_CFLAGS=
PREFIX=`pwd`/prebuilt/x86
build_one
