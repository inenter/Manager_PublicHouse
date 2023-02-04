package com.cykj.bean;


import java.sql.Date;

public class TbFamily {

  private int familyId;
  private int renterId;
  private String familyName;
  private String familyIdCard;
  private Date familyBirthday;
  private String familyTel;
  private String familyCardImg;
  private String familyReBookImg;
  private String work;
  private String relation;

  public TbFamily() {
  }

  public TbFamily(int familyId, int renterId, String familyName, String familyIdCard, Date familyBirthday, String familyTel, String familyCardImg, String familyReBookImg, String work, String relation) {
    this.familyId = familyId;
    this.renterId = renterId;
    this.familyName = familyName;
    this.familyIdCard = familyIdCard;
    this.familyBirthday = familyBirthday;
    this.familyTel = familyTel;
    this.familyCardImg = familyCardImg;
    this.familyReBookImg = familyReBookImg;
    this.work = work;
    this.relation = relation;
  }

  @Override
  public String toString() {
    return "TbFamily{" +
            "familyId=" + familyId +
            ", renterId=" + renterId +
            ", familyName='" + familyName + '\'' +
            ", familyIdCard='" + familyIdCard + '\'' +
            ", familyBirthday=" + familyBirthday +
            ", familyTel='" + familyTel + '\'' +
            ", familyCardImg='" + familyCardImg + '\'' +
            ", familyReBookImg='" + familyReBookImg + '\'' +
            ", work='" + work + '\'' +
            ", relation='" + relation + '\'' +
            '}';
  }

  public int getFamilyId() {
    return familyId;
  }

  public void setFamilyId(int familyId) {
    this.familyId = familyId;
  }


  public int getRenterId() {
    return renterId;
  }

  public void setRenterId(int renterId) {
    this.renterId = renterId;
  }


  public String getFamilyName() {
    return familyName;
  }

  public void setFamilyName(String familyName) {
    this.familyName = familyName;
  }


  public String getFamilyIdCard() {
    return familyIdCard;
  }

  public void setFamilyIdCard(String familyIdCard) {
    this.familyIdCard = familyIdCard;
  }


  public Date getFamilyBirthday() {
    return familyBirthday;
  }

  public void setFamilyBirthday(Date familyBirthday) {
    this.familyBirthday = familyBirthday;
  }


  public String getFamilyTel() {
    return familyTel;
  }

  public void setFamilyTel(String familyTel) {
    this.familyTel = familyTel;
  }


  public String getFamilyCardImg() {
    return familyCardImg;
  }

  public void setFamilyCardImg(String familyCardImg) {
    this.familyCardImg = familyCardImg;
  }


  public String getFamilyReBookImg() {
    return familyReBookImg;
  }

  public void setFamilyReBookImg(String familyReBookImg) {
    this.familyReBookImg = familyReBookImg;
  }


  public String getWork() {
    return work;
  }

  public void setWork(String work) {
    this.work = work;
  }


  public String getRelation() {
    return relation;
  }

  public void setRelation(String relation) {
    this.relation = relation;
  }

}
