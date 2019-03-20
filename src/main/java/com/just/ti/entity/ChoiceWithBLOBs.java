package com.just.ti.entity;

public class ChoiceWithBLOBs extends Choice {
    private String pa;

    private String pb;

    private String pc;

    private String pd;

    private String jiexi;

    public String getPa() {
        return pa;
    }

    public void setPa(String pa) {
        this.pa = pa == null ? null : pa.trim();
    }

    public String getPb() {
        return pb;
    }

    public void setPb(String pb) {
        this.pb = pb == null ? null : pb.trim();
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc == null ? null : pc.trim();
    }

    public String getPd() {
        return pd;
    }

    public void setPd(String pd) {
        this.pd = pd == null ? null : pd.trim();
    }

    public String getJiexi() {
        return jiexi;
    }

    public void setJiexi(String jiexi) {
        this.jiexi = jiexi == null ? null : jiexi.trim();
    }
}