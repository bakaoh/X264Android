package com.github.bakaoh.x264;

/**
 * Created by taitt on 12/01/2017.
 */

public class X264InitResult {

    public int err;
    public byte[] sps;
    public byte[] pps;

    public X264InitResult(int err, byte[] sps, byte[] pps) {
        this.err = err;
        this.sps = sps;
        this.pps = pps;
    }
}
