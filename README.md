# X264Android #

## Description ##

x264 encoder to being using through jni in Android.

## Using ##

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

* Download the [Android NDK][]:

[Android NDK]: https://developer.android.com/tools/sdk/ndk/index.html

* Set the following environment variables:
```
ANDROID_NDK_ROOT="<path to Android NDK>"
ANDROID_NDK_PLATFORM="<platform to build to>"
ANDROID_NDK_HOST="<your-build-host>"
```

** Example:
```
ANDROID_NDK_ROOT=/home/forlayo/android-ndk-r21e
ANDROID_NDK_PLATFORM=android-21
ANDROID_NDK_HOST=linux-x86_64
```

* Fetch and build libx264.

```
cd "<repository checkout dir>/x264-android/src/main/cpp" && \
git clone http://git.videolan.org/git/x264.git libx264 && \
git checkout ae03d92b52bb7581df2e75d571989cb1ecd19cbd && \
./build_x264.sh
```
You can use other commit of libx264, but its tested on provided one; which is the most actual at the momment of writting this.

* Open project in Android Studio to build the JNI native libraries.
