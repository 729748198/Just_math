package com.just.ti.entity;

public class Tiankong {
    private Integer id;

    private String tiId;

    private Integer answerType;

    @Override
    public String toString() {
        return "Tiankong{" +
                "id=" + id +
                ", tiId='" + tiId + '\'' +
                ", answerType=" + answerType +
                ", jiexi='" + jiexi + '\'' +
                '}';
    }

    private String jiexi;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTiId() {
        return tiId;
    }

    public void setTiId(String tiId) {
        this.tiId = tiId == null ? null : tiId.trim();
    }

    public Integer getAnswerType() {
        return answerType;
    }

    public void setAnswerType(Integer answerType) {
        this.answerType = answerType;
    }

    public String getJiexi() {
        return jiexi;
    }

    public void setJiexi(String jiexi) {
        this.jiexi = jiexi == null ? null : jiexi.trim();
    }
}