package com.just.ti.entity;

import java.util.Date;

public class UserTi {
    private Integer id;

    private String tiId;

    private String username;

    private Integer isDo;

    private Date dotime;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getIsDo() {
        return isDo;
    }

    public void setIsDo(Integer isDo) {
        this.isDo = isDo;
    }

    public Date getDotime() {
        return dotime;
    }

    public void setDotime(Date dotime) {
        this.dotime = dotime;
    }
}