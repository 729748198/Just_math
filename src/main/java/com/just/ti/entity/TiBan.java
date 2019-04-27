package com.just.ti.entity;

public class TiBan {
    private Integer id;

    private Integer sumScore;

    private String ban;

    private Integer sumSelect;

    private Integer sumTiankong;

    private Integer sumPanduan;

    private Integer sumDati;

    private String temp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSumScore() {
        return sumScore;
    }

    public void setSumScore(Integer sumScore) {
        this.sumScore = sumScore;
    }

    public String getBan() {
        return ban;
    }

    public void setBan(String ban) {
        this.ban = ban == null ? null : ban.trim();
    }

    public Integer getSumSelect() {
        return sumSelect;
    }

    public void setSumSelect(Integer sumSelect) {
        this.sumSelect = sumSelect;
    }

    public Integer getSumTiankong() {
        return sumTiankong;
    }

    public void setSumTiankong(Integer sumTiankong) {
        this.sumTiankong = sumTiankong;
    }

    public Integer getSumPanduan() {
        return sumPanduan;
    }

    public void setSumPanduan(Integer sumPanduan) {
        this.sumPanduan = sumPanduan;
    }

    public Integer getSumDati() {
        return sumDati;
    }

    public void setSumDati(Integer sumDati) {
        this.sumDati = sumDati;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp == null ? null : temp.trim();
    }
}