package com.cykj.bean;


import java.sql.Date;

public class TbApply {

  private int applyId;
  private int renterId;
  private String areaName;
  private Date birthday;
  private String idCardImg;
  private String rebookPerImg;
  private long familyIncome;
  private String enType;
  private long houseArea;
  private String grabookImg;
  private String remarks;
  private String applyState;
  private String phone;
  private String applyName;
  private String familySum;
  private String idCard;

  public TbApply() {
  }

  public TbApply(int applyId, int renterId, String areaName, Date birthday, String idCardImg, String rebookPerImg, long familyIncome, String enType, long houseArea, String grabookImg, String remarks, String applyState, String phone, String applyName, String familySum, String idCard) {
    this.applyId = applyId;
    this.renterId = renterId;
    this.areaName = areaName;
    this.birthday = birthday;
    this.idCardImg = idCardImg;
    this.rebookPerImg = rebookPerImg;
    this.familyIncome = familyIncome;
    this.enType = enType;
    this.houseArea = houseArea;
    this.grabookImg = grabookImg;
    this.remarks = remarks;
    this.applyState = applyState;
    this.phone = phone;
    this.applyName = applyName;
    this.familySum = familySum;
    this.idCard = idCard;
  }

  @Override
  public String toString() {
    return "TbApply{" +
            "applyId=" + applyId +
            ", renterId=" + renterId +
            ", areaName='" + areaName + '\'' +
            ", birthday=" + birthday +
            ", idCardImg='" + idCardImg + '\'' +
            ", rebookPerImg='" + rebookPerImg + '\'' +
            ", familyIncome=" + familyIncome +
            ", enType='" + enType + '\'' +
            ", houseArea=" + houseArea +
            ", grabookImg='" + grabookImg + '\'' +
            ", remarks='" + remarks + '\'' +
            ", applyState='" + applyState + '\'' +
            ", phone='" + phone + '\'' +
            ", applyName='" + applyName + '\'' +
            ", familySum='" + familySum + '\'' +
            ", idCard='" + idCard + '\'' +
            '}';
  }


  public int getApplyId() {
    return applyId;
  }

  public void setApplyId(int applyId) {
    this.applyId = applyId;
  }


  public int getRenterId() {
    return renterId;
  }

  public void setRenterId(int renterId) {
    this.renterId = renterId;
  }


  public String getAreaName() {
    return areaName;
  }

  public void setAreaName(String areaName) {
    this.areaName = areaName;
  }


  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }


  public String getIdCardImg() {
    return idCardImg;
  }

  public void setIdCardImg(String idCardImg) {
    this.idCardImg = idCardImg;
  }


  public String getRebookPerImg() {
    return rebookPerImg;
  }

  public void setRebookPerImg(String rebookPerImg) {
    this.rebookPerImg = rebookPerImg;
  }


  public long getFamilyIncome() {
    return familyIncome;
  }

  public void setFamilyIncome(long familyIncome) {
    this.familyIncome = familyIncome;
  }


  public String getEnType() {
    return enType;
  }

  public void setEnType(String enType) {
    this.enType = enType;
  }


  public long getHouseArea() {
    return houseArea;
  }

  public void setHouseArea(long houseArea) {
    this.houseArea = houseArea;
  }


  public String getGrabookImg() {
    return grabookImg;
  }

  public void setGrabookImg(String grabookImg) {
    this.grabookImg = grabookImg;
  }


  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }


  public String getApplyState() {
    return applyState;
  }

  public void setApplyState(String applyState) {
    this.applyState = applyState;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getApplyName() {
    return applyName;
  }

  public void setApplyName(String applyName) {
    this.applyName = applyName;
  }


  public String getFamilySum() {
    return familySum;
  }

  public void setFamilySum(String familySum) {
    this.familySum = familySum;
  }

  public String getIdCard() {
    return idCard;
  }

  public void setIdCard(String idCard) {
    this.idCard = idCard;
  }
}
