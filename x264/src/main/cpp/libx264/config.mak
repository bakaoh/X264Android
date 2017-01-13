SRCPATH=.
prefix=/home/taitt/works/github/X264Android/x264/src/main/cpp/prebuilt/x86
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
SYS_ARCH=X86
SYS=LINUX
CC=/home/taitt/Android/Sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-gcc
CFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math -m32  -Wall -I. -I$(SRCPATH) --sysroot=/home/taitt/Android/Sdk/ndk-bundle/platforms/android-9/arch-x86/  -march=i686 -mfpmath=sse -msse -msse2 -std=gnu99 -D_GNU_SOURCE -mpreferred-stack-boundary=5 -fPIC -fomit-frame-pointer -fno-tree-vectorize
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=/home/taitt/Android/Sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-gcc -o 
LDFLAGS=-m32  --sysroot=/home/taitt/Android/Sdk/ndk-bundle/platforms/android-9/arch-x86/ -nostdlib -lm -s -ldl
LIBX264=libx264.a
AR=/home/taitt/Android/Sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-gcc-ar rc 
RANLIB=/home/taitt/Android/Sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-gcc-ranlib
STRIP=/home/taitt/Android/Sdk/ndk-bundle/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-strip
INSTALL=install
AS=yasm
ASFLAGS= -I. -I$(SRCPATH) -DARCH_X86_64=0 -I$(SRCPATH)/common/x86/ -f elf32 -Worphan-labels -DSTACK_ALIGNMENT=32 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
default: lib-static
install: install-lib-static
LDFLAGSCLI = 
CLI_LIBX264 = $(LIBX264)
