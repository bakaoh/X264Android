package com.github.bakaoh.x264;

/**
 * Created by taitt on 12/01/2017.
 */

public class X264EncodeResult {

    public int err;
    public byte[] data;
    public long pts;
    public boolean isKey;

    public X264EncodeResult(int err, byte[] data, long pts, boolean isKey) {
        this.err = err;
        this.data = data;
        this.pts = pts;
        this.isKey = isKey;
    }
}
