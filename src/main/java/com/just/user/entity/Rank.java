package com.just.user.entity;

public class Rank {
    /**
     * 新增的一个参数，当初数据库没有设置好，这个当作传给前台的板块分数
     */
    private Integer fen;

    public Integer getFen() {
        return fen;
    }

    public void setFen(Integer fen) {
        this.fen = fen;
    }

    private String username;

    private Integer he;

    private Integer one;

    private Integer two;

    private Integer three;

    private Integer four;

    private Integer five;

    private Integer six;

    private Integer seven;

    private Integer eight;

    private Integer nine;

    private Integer ten;

    private Integer eleven;

    private Integer tweven;

    private Integer xiandai;

    private Integer gailvlun;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer gethe() {
        return he;
    }

    public void sethe(Integer he) {
        this.he = he;
    }

    public Integer getOne() {
        return one;
    }

    public void setOne(Integer one) {
        this.one = one;
    }

    public Integer getTwo() {
        return two;
    }

    public void setTwo(Integer two) {
        this.two = two;
    }

    public Integer getThree() {
        return three;
    }

    public void setThree(Integer three) {
        this.three = three;
    }

    public Integer getFour() {
        return four;
    }

    public void setFour(Integer four) {
        this.four = four;
    }

    public Integer getFive() {
        return five;
    }

    public void setFive(Integer five) {
        this.five = five;
    }

    public Integer getSix() {
        return six;
    }

    public void setSix(Integer six) {
        this.six = six;
    }

    public Integer getSeven() {
        return seven;
    }

    public void setSeven(Integer seven) {
        this.seven = seven;
    }

    public Integer getEight() {
        return eight;
    }

    public void setEight(Integer eight) {
        this.eight = eight;
    }

    public Integer getNine() {
        return nine;
    }

    public void setNine(Integer nine) {
        this.nine = nine;
    }

    public Integer getTen() {
        return ten;
    }

    public void setTen(Integer ten) {
        this.ten = ten;
    }

    public Integer getEleven() {
        return eleven;
    }

    public void setEleven(Integer eleven) {
        this.eleven = eleven;
    }

    public Integer getTweven() {
        return tweven;
    }

    public void setTweven(Integer tweven) {
        this.tweven = tweven;
    }

    public Integer getXiandai() {
        return xiandai;
    }

    public void setXiandai(Integer xiandai) {
        this.xiandai = xiandai;
    }

    public Integer getGailvlun() {
        return gailvlun;
    }

    public void setGailvlun(Integer gailvlun) {
        this.gailvlun = gailvlun;
    }

    public Integer get(String Ban){
        switch (Ban){
            case "高数第一章":return getOne();
            case "高数第二章":return getTwo();
            case "高数第三章":return getThree();
            case "高数第四章":return getFour();
            case "高数第五章":return getFive();
            case "高数第六章":return getSix();
            case "高数第七章":return getSeven();
            case "高数第八章":return getEight();
            case "高数第九章":return getNine();
            case "高数第十章":return getTen();
            case "高数第十一章":return getEleven();
            case "高数第十二章":return getTweven();
            case "概率论":return getGailvlun();
            case "线性代数":return getXiandai();
            case "总排行":return gethe();

            default:break;
        }
        return null;
    }
}