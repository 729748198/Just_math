package com.just.ti.entity;

public class Answer {
    private Integer id;

    private Integer tiId;

    private Integer answerType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTiId() {
        return tiId;
    }

    public void setTiId(Integer tiId) {
        this.tiId = tiId;
    }

    public Integer getAnswerType() {
        return answerType;
    }

    public void setAnswerType(Integer answerType) {
        this.answerType = answerType;
    }
}