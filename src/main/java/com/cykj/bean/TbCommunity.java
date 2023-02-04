package com.cykj.bean;


public class TbCommunity {

  private int communityId;
  private int toareaId;
  private String communityName;
  private String comState;
  private String address;
  private String comimages;
  private int parkingNum;

  public TbCommunity() {
  }

  public TbCommunity(int communityId, int toareaId, String communityName, String comState, String address, String comimages, int parkingNum) {
    this.communityId = communityId;
    this.toareaId = toareaId;
    this.communityName = communityName;
    this.comState = comState;
    this.address = address;
    this.comimages = comimages;
    this.parkingNum = parkingNum;
  }

  @Override
  public String toString() {
    return "TbCommunity{" +
            "communityId=" + communityId +
            ", toareaId=" + toareaId +
            ", communityName='" + communityName + '\'' +
            ", comState='" + comState + '\'' +
            ", address='" + address + '\'' +
            ", comimages='" + comimages + '\'' +
            ", parkingNum=" + parkingNum +
            '}';
  }

  public int getCommunityId() {
    return communityId;
  }

  public void setCommunityId(int communityId) {
    this.communityId = communityId;
  }

  public int getToareaId() {
    return toareaId;
  }

  public void setToareaId(int toareaId) {
    this.toareaId = toareaId;
  }

  public String getCommunityName() {
    return communityName;
  }

  public void setCommunityName(String communityName) {
    this.communityName = communityName;
  }

  public String getComState() {
    return comState;
  }

  public void setComState(String comState) {
    this.comState = comState;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getComimages() {
    return comimages;
  }

  public void setComimages(String comimages) {
    this.comimages = comimages;
  }

  public int getParkingNum() {
    return parkingNum;
  }

  public void setParkingNum(int parkingNum) {
    this.parkingNum = parkingNum;
  }
}
