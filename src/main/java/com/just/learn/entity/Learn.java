package com.just.learn.entity;

public class Learn {
    private Integer id;

    private String learnBan;

    private Integer isVideo;

    private String videoAdress;

    private String learnTitle;

    private String learnContent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLearnBan() {
        return learnBan;
    }

    public void setLearnBan(String learnBan) {
        this.learnBan = learnBan == null ? null : learnBan.trim();
    }

    public Integer getIsVideo() {
        return isVideo;
    }

    public void setIsVideo(Integer isVideo) {
        this.isVideo = isVideo;
    }

    public String getVideoAdress() {
        return videoAdress;
    }

    public void setVideoAdress(String videoAdress) {
        this.videoAdress = videoAdress == null ? null : videoAdress.trim();
    }

    public String getLearnTitle() {
        return learnTitle;
    }

    public void setLearnTitle(String learnTitle) {
        this.learnTitle = learnTitle == null ? null : learnTitle.trim();
    }

    public String getLearnContent() {
        return learnContent;
    }

    public void setLearnContent(String learnContent) {
        this.learnContent = learnContent == null ? null : learnContent.trim();
    }
}