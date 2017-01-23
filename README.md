# X264Android #

## Description ##

x264 for android

## Build instructions ##

* Set the following environment variable:

```
X264_ANDROID_ROOT="<path to x264android checkout>"
```

* Download the [Android NDK][] and set its location in an environment variable:

[Android NDK]: https://developer.android.com/tools/sdk/ndk/index.html

```
NDK_PATH="<path to Android NDK>"
```

* Fetch and build libx264.

```
cd "${X264_ANDROID_ROOT}/x264/src/main/cpp" && \
git clone http://git.videolan.org/git/x264.git libx264 && \
./build_x264.sh
```

* Open project in Android Studio to build the JNI native libraries.
