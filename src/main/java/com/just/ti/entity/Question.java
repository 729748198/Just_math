package com.just.ti.entity;

public class Question {
    private String id;

    private String tiTitle;

    private String tiBan;

    private String tiScore;

    private Integer tiType;

    private Integer tiEro;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTiTitle() {
        return tiTitle;
    }

    public void setTiTitle(String tiTitle) {
        this.tiTitle = tiTitle == null ? null : tiTitle.trim();
    }

    public String getTiBan() {
        return tiBan;
    }

    public void setTiBan(String tiBan) {
        this.tiBan = tiBan == null ? null : tiBan.trim();
    }

    public String getTiScore() {
        return tiScore;
    }

    public void setTiScore(String tiScore) {
        this.tiScore = tiScore == null ? null : tiScore.trim();
    }

    public Integer getTiType() {
        return tiType;
    }

    public void setTiType(Integer tiType) {
        this.tiType = tiType;
    }

    public Integer getTiEro() {
        return tiEro;
    }

    public void setTiEro(Integer tiEro) {
        this.tiEro = tiEro;
    }
}