package com.cykj.bean;


public class TbHouse {

  private int houseId;
  private int tocommunityId;
  private int buildingNum;
  private String houseNum;
  private double houseArea;
  private double money;
  private int roomNum;
  private int washroomNum;
  private int livingroomNum;
  private int kitchenNum;
  private int balconyNum;
  private String remark;
  private String images;

  public TbHouse() {
  }

  public TbHouse(int houseId, int tocommunityId, int buildingNum, String houseNum, double houseArea, double money, int roomNum, int washroomNum, int livingroomNum, int kitchenNum, int balconyNum, String remark, String images) {
    this.houseId = houseId;
    this.tocommunityId = tocommunityId;
    this.buildingNum = buildingNum;
    this.houseNum = houseNum;
    this.houseArea = houseArea;
    this.money = money;
    this.roomNum = roomNum;
    this.washroomNum = washroomNum;
    this.livingroomNum = livingroomNum;
    this.kitchenNum = kitchenNum;
    this.balconyNum = balconyNum;
    this.remark = remark;
    this.images = images;
  }

  @Override
  public String toString() {
    return "TbHouse{" +
            "houseId=" + houseId +
            ", tocommunityId=" + tocommunityId +
            ", buildingNum=" + buildingNum +
            ", houseNum='" + houseNum + '\'' +
            ", houseArea=" + houseArea +
            ", money=" + money +
            ", roomNum=" + roomNum +
            ", washroomNum=" + washroomNum +
            ", livingroomNum=" + livingroomNum +
            ", kitchenNum=" + kitchenNum +
            ", balconyNum=" + balconyNum +
            ", remark='" + remark + '\'' +
            ", images='" + images + '\'' +
            '}';
  }

  public int getHouseId() {
    return houseId;
  }

  public void setHouseId(int houseId) {
    this.houseId = houseId;
  }

  public int getTocommunityId() {
    return tocommunityId;
  }

  public void setTocommunityId(int tocommunityId) {
    this.tocommunityId = tocommunityId;
  }

  public int getBuildingNum() {
    return buildingNum;
  }

  public void setBuildingNum(int buildingNum) {
    this.buildingNum = buildingNum;
  }

  public String getHouseNum() {
    return houseNum;
  }

  public void setHouseNum(String houseNum) {
    this.houseNum = houseNum;
  }

  public double getHouseArea() {
    return houseArea;
  }

  public void setHouseArea(double houseArea) {
    this.houseArea = houseArea;
  }

  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }

  public int getRoomNum() {
    return roomNum;
  }

  public void setRoomNum(int roomNum) {
    this.roomNum = roomNum;
  }

  public int getWashroomNum() {
    return washroomNum;
  }

  public void setWashroomNum(int washroomNum) {
    this.washroomNum = washroomNum;
  }

  public int getLivingroomNum() {
    return livingroomNum;
  }

  public void setLivingroomNum(int livingroomNum) {
    this.livingroomNum = livingroomNum;
  }

  public int getKitchenNum() {
    return kitchenNum;
  }

  public void setKitchenNum(int kitchenNum) {
    this.kitchenNum = kitchenNum;
  }

  public int getBalconyNum() {
    return balconyNum;
  }

  public void setBalconyNum(int balconyNum) {
    this.balconyNum = balconyNum;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getImages() {
    return images;
  }

  public void setImages(String images) {
    this.images = images;
  }
}
