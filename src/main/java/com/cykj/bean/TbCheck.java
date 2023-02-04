package com.cykj.bean;


public class TbCheck {

  private int checkId;
  private int managerId;
  private int applyId;
  private String checkState;
  private String areaName;
  private String applyName;
  private long familyIncome;
  private String houseArea;
  private Integer renterId;
  private String applyTime;

  public TbCheck() {

  }

  public TbCheck(int checkId, int managerId, int applyId, String checkState) {
    this.checkId = checkId;
    this.managerId = managerId;
    this.applyId = applyId;
    this.checkState = checkState;
  }

  public TbCheck(int checkId, int managerId, int applyId, String checkState, String areaName, String applyName, long familyIncome, String houseArea, Integer renterId, String applyTime) {
    this.checkId = checkId;
    this.managerId = managerId;
    this.applyId = applyId;
    this.checkState = checkState;
    this.areaName = areaName;
    this.applyName = applyName;
    this.familyIncome = familyIncome;
    this.houseArea = houseArea;
    this.renterId = renterId;
    this.applyTime = applyTime;
  }

  @Override
  public String toString() {
    return "TbCheck{" +
            "checkId=" + checkId +
            ", managerId=" + managerId +
            ", applyId=" + applyId +
            ", checkState='" + checkState + '\'' +
            ", areaName='" + areaName + '\'' +
            ", applyName='" + applyName + '\'' +
            ", familyIncome=" + familyIncome +
            ", houseArea='" + houseArea + '\'' +
            ", renterId=" + renterId +
            ", applyTime='" + applyTime + '\'' +
            '}';
  }

  public int getCheckId() {
    return checkId;
  }

  public void setCheckId(int checkId) {
    this.checkId = checkId;
  }

  public int getManagerId() {
    return managerId;
  }

  public void setManagerId(int managerId) {
    this.managerId = managerId;
  }

  public int getApplyId() {
    return applyId;
  }

  public void setApplyId(int applyId) {
    this.applyId = applyId;
  }

  public String getCheckState() {
    return checkState;
  }

  public void setCheckState(String checkState) {
    this.checkState = checkState;
  }

  public String getAreaName() {
    return areaName;
  }

  public void setAreaName(String areaName) {
    this.areaName = areaName;
  }

  public String getApplyName() {
    return applyName;
  }

  public void setApplyName(String applyName) {
    this.applyName = applyName;
  }

  public long getFamilyIncome() {
    return familyIncome;
  }

  public void setFamilyIncome(long familyIncome) {
    this.familyIncome = familyIncome;
  }

  public String getHouseArea() {
    return houseArea;
  }

  public void setHouseArea(String houseArea) {
    this.houseArea = houseArea;
  }

  public Integer getRenterId() {
    return renterId;
  }

  public void setRenterId(Integer renterId) {
    this.renterId = renterId;
  }

  public String getApplyTime() {
    return applyTime;
  }

  public void setApplyTime(String applyTime) {
    this.applyTime = applyTime;
  }
}
