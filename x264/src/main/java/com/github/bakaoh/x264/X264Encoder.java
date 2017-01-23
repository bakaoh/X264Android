package com.github.bakaoh.x264;

/**
 * Created by taitt on 09/01/2017.
 */

public class X264Encoder {

    public native X264InitResult initEncoder(X264Params params);

    public native void releaseEncoder();

    public native X264EncodeResult encodeFrame(byte[] frame, int colorFormat, long pts);

    public native String getVersion();

    private long ctx;

    static {
        System.loadLibrary("x264a");
    }
}
