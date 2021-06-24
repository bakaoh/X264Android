#!/bin/bash

if [ -z $ANDROID_NDK_ROOT ]; then
  ANDROID_NDK_ROOT=/home/forlayo/android-ndk-r21e
  echo ANDROID_NDK_ROOT not defined.
  echo Setting it up to ${ANDROID_NDK_ROOT}
fi

if [ -z $ANDROID_NDK_PLATFORM ]; then
  ANDROID_NDK_PLATFORM=android-21
  echo ANDROID_NDK_PLATFORM not defined.
  echo Setting it up to ${ANDROID_NDK_PLATFORM}

fi

if [ -z $ANDROID_NDK_HOST ]; then
  ANDROID_NDK_HOST=linux-x86_64
  echo ANDROID_NDK_HOST not defined.
  echo Setting it up to ${ANDROID_NDK_HOST}
fi

TOOLCHAIN=${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/${ANDROID_NDK_HOST}
ANDROID_VERSION=`echo "${ANDROID_NDK_PLATFORM}"|cut -d - -f 2`

function build_one
{
if [ $ARCH == "arm" ] 
then
    COMPILER=armv7a-linux-androideabi
    COMPILER_PREFIX=arm-linux-androideabi-
    HOST=arm-linux
    export CC=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang # c compiler path
    export CXX=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang++ # c++ compiler path

elif [ $ARCH == "aarch64" ] 
then
    COMPILER=aarch64-linux-android
    COMPILER_PREFIX=aarch64-linux-android-
    HOST=aarch64-linux
    export CC=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang # c compiler path
    export CXX=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang++ # c++ compiler path
elif [ $ARCH == "x86_64" ] 
then
    COMPILER=x86_64-linux-android
    COMPILER_PREFIX=x86_64-linux-android-
    HOST=x86_64-linux
    export CC=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang # c compiler path
    export CXX=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang++ # c++ compiler path
elif [ $ARCH == "x86" ] 
then
    COMPILER=i686-linux-android
    COMPILER_PREFIX=i686-linux-android-
    HOST=i686-linux
    export CC=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang # c compiler path
    export CXX=${TOOLCHAIN}/bin/${COMPILER}${ANDROID_VERSION}-clang++ # c++ compiler path
fi

pushd libx264
./configure --prefix=$PREFIX \
        --host=$HOST \
        --sysroot=${TOOLCHAIN}/sysroot \
        --cross-prefix=${TOOLCHAIN}/bin/${COMPILER_PREFIX} \
        --extra-cflags="$OPTIMIZE_CFLAGS" \
        --extra-ldflags="-nostdlib" \
        --enable-pic \
        --enable-static \
        --enable-strip \
        --disable-asm \
        --disable-opencl \
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

#x86_64
ARCH=x86_64
OPTIMIZE_CFLAGS=
PREFIX=`pwd`/prebuilt/x86_64
build_one

#x86_64
ARCH=x86
OPTIMIZE_CFLAGS=
PREFIX=`pwd`/prebuilt/x86
build_one

