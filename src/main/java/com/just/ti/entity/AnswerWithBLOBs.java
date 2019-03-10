package com.just.ti.entity;

public class AnswerWithBLOBs extends Answer {
    private String answer;

    private String jiexi;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getJiexi() {
        return jiexi;
    }

    public void setJiexi(String jiexi) {
        this.jiexi = jiexi == null ? null : jiexi.trim();
    }
}