package com.just.ti.entity;

public class Question {
    private Integer id;

    private String tiBan;

    private String tiScore;

    private Integer tiSum;

    private Integer tiEro;

    private String tiTitle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getTiSum() {
        return tiSum;
    }

    public void setTiSum(Integer tiSum) {
        this.tiSum = tiSum;
    }

    public Integer getTiEro() {
        return tiEro;
    }

    public void setTiEro(Integer tiEro) {
        this.tiEro = tiEro;
    }

    public String getTiTitle() {
        return tiTitle;
    }

    public void setTiTitle(String tiTitle) {
        this.tiTitle = tiTitle == null ? null : tiTitle.trim();
    }
}