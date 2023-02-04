package com.cykj.bean;


public class TbDistribute {

    private int distributeId;
    private int houseId;
    private int renterId;
    private String dataState;
    private int applyId;
    private String areaName;
    private String applyName;
    private long familyIncome;
    private String familySum;
    private String applyTime;
    private int buildingNum;
    private String houseNum;
    private String houseNo;
    private String remark;

    public TbDistribute() {
    }

    public TbDistribute(int distributeId, int houseId, int renterId, String dataState) {
        this.distributeId = distributeId;
        this.houseId = houseId;
        this.renterId = renterId;
        this.dataState = dataState;
    }

    @Override
    public String toString() {
        return "TbDistribute{" +
                "distributeId=" + distributeId +
                ", houseId=" + houseId +
                ", renterId=" + renterId +
                ", dataState='" + dataState + '\'' +
                ", applyId=" + applyId +
                ", areaName='" + areaName + '\'' +
                ", applyName='" + applyName + '\'' +
                ", familyIncome=" + familyIncome +
                ", familySum='" + familySum + '\'' +
                ", buildingNum=" + buildingNum +
                ", houseNum='" + houseNum + '\'' +
                ", houseNo='" + houseNo + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int getDistributeId() {
        return distributeId;
    }

    public void setDistributeId(int distributeId) {
        this.distributeId = distributeId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getRenterId() {
        return renterId;
    }

    public void setRenterId(int renterId) {
        this.renterId = renterId;
    }

    public String getDataState() {
        return dataState;
    }

    public void setDataState(String dataState) {
        this.dataState = dataState;
    }

    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }

    public int getApplyId() {
        return applyId;
    }

    public void setApplyId(int applyId) {
        this.applyId = applyId;
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

    public String getFamilySum() {
        return familySum;
    }

    public void setFamilySum(String familySum) {
        this.familySum = familySum;
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

    public String getHouseNo() {
        return houseNo;
    }

    public void setHouseNo() {
        this.houseNo = this.buildingNum + "#" + this.houseNum;
        if (this.buildingNum == 0) {
            this.houseNo = "";
        }
    }

    public long getFamilyIncome() {
        return familyIncome;
    }

    public void setFamilyIncome(long familyIncome) {
        this.familyIncome = familyIncome;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }
}
