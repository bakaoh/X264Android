# X264Android #

## Description ##

x264 jni for android

## Using ##

* Make sure you have the jcenter repository included in the `build.gradle` file in the root of your project:

```
repositories {
    jcenter()
}
```

*  Include the following in your module's `build.gradle` file:

```
compile 'com.github.bakaoh:x264-android:X.X.X'
```

for the version X.X.X, see the project on [Bintray](https://bintray.com/bakaoh/maven/x264-android).

* Create `X264Encoder` and `X264Params`

```
X264Encoder encoder = new X264Encoder();

X264Params params = new X264Params();
params.width =  1280;
params.height = 720;
params.bitrate = 1000 * 1024;
params.fps = 25;
params.gop = params.fps * 2;
params.preset = "ultrafast";
params.profile = "baseline";
```

* Init encoder

```
X264InitResult initRs = encoder.initEncoder(params);

if (initRs.err == 0) {
  // process initRs.sps, initRs.pps
}
```

* Encode frame

```
X264EncodeResult encodedFrame = encoder.encodeFrame(inputFrame, X264Params.CSP_NV21, presentationTimestamp);

if (encodedFrame.err == 0) {
  // process encodedFrame.data
}
```

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
