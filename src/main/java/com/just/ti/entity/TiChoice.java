package com.just.ti.entity;

public class TiChoice {

    private String id;

    private String answer;

    private String pa;

    private String pb;

    private String pc;

    private String pd;

    private String jiexi;

    @Override
    public String toString() {
        return "TiChoice{" +
                "id='" + id + '\'' +
                ", answer='" + answer + '\'' +
                ", pa='" + pa + '\'' +
                ", pb='" + pb + '\'' +
                ", pc='" + pc + '\'' +
                ", pd='" + pd + '\'' +
                ", jiexi='" + jiexi + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

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