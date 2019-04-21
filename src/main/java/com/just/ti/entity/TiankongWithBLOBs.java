package com.just.ti.entity;

public class TiankongWithBLOBs extends Tiankong {
    private String answerformarch;

    private String answerforshow;

    public String getAnswerformarch() {
        return answerformarch;
    }

    public void setAnswerformarch(String answerformarch) {
        this.answerformarch = answerformarch == null ? null : answerformarch.trim();
    }

    public String getAnswerforshow() {
        return answerforshow;
    }

    public void setAnswerforshow(String answerforshow) {
        this.answerforshow = answerforshow == null ? null : answerforshow.trim();
    }
}